#!/bin/bash

# Setup Azure resources for healthcare microservices
set -e

echo "=== Azure Setup Script for Healthcare Microservices ==="

# Variables
SUBSCRIPTION_ID=${1:-$ARM_SUBSCRIPTION_ID}
ENVIRONMENT="dev"
LOCATION="East US"
RESOURCE_GROUP_NAME="rg-healthcare-${ENVIRONMENT}"
STORAGE_ACCOUNT_NAME="tfstatehealthcare${ENVIRONMENT}$(date +%s | tail -c 4)"
CONTAINER_NAME="tfstate"

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "Error: Azure CLI is not installed. Please install it first."
    exit 1
fi

# Login to Azure
echo "Logging into Azure..."
az login

# Set subscription
if [ -n "$SUBSCRIPTION_ID" ]; then
    echo "Setting subscription to $SUBSCRIPTION_ID"
    az account set --subscription "$SUBSCRIPTION_ID"
fi

# Create resource group
echo "Creating resource group: $RESOURCE_GROUP_NAME"
az group create \
    --name "$RESOURCE_GROUP_NAME" \
    --location "$LOCATION" \
    --tags Environment="$ENVIRONMENT" Project="healthcare-microservices"

# Create storage account for Terraform state
echo "Creating storage account: $STORAGE_ACCOUNT_NAME"
az storage account create \
    --resource-group "$RESOURCE_GROUP_NAME" \
    --name "$STORAGE_ACCOUNT_NAME" \
    --sku Standard_LRS \
    --encryption-services blob \
    --https-only true \
    --min-tls-version TLS1_2 \
    --tags Environment="$ENVIRONMENT" Project="healthcare-microservices"

# Create storage container
echo "Creating storage container: $CONTAINER_NAME"
az storage container create \
    --name "$CONTAINER_NAME" \
    --account-name "$STORAGE_ACCOUNT_NAME" \
    --public-access off

# Get storage account key
STORAGE_KEY=$(az storage account keys list \
    --resource-group "$RESOURCE_GROUP_NAME" \
    --account-name "$STORAGE_ACCOUNT_NAME" \
    --query "[0].value" -o tsv)

# Create service principal for GitHub Actions
echo "Creating service principal for GitHub Actions..."
SP_JSON=$(az ad sp create-for-rbac \
    --name "http://healthcare-microservices-sp" \
    --role Contributor \
    --scopes "/subscriptions/$(az account show --query id -o tsv)/resourceGroups/$RESOURCE_GROUP_NAME" \
    --sdk-auth)

echo ""
echo "=== SETUP COMPLETED ==="
echo ""
echo "Please add the following GitHub secrets:"
echo ""
echo "ARM_SUBSCRIPTION_ID: $(az account show --query id -o tsv)"
echo "ARM_TENANT_ID: $(az account show --query tenantId -o tsv)"
echo "ARM_CLIENT_ID: $(echo $SP_JSON | jq -r '.clientId')"
echo "ARM_CLIENT_SECRET: $(echo $SP_JSON | jq -r '.clientSecret')"
echo ""
echo "Update infrastructure/environments/dev/backend.tf with:"
echo "storage_account_name = \"$STORAGE_ACCOUNT_NAME\""
echo "resource_group_name  = \"$RESOURCE_GROUP_NAME\""
echo ""
echo "Service Principal JSON:"
echo $SP_JSON