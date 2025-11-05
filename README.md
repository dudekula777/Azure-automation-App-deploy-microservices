# Healthcare Microservices on AKS

This project demonstrates deploying containerized microservices to Azure Kubernetes Service (AKS).

## Architecture

- **Patient Service**: Manages patient records
- **Appointment Service**: Manages appointment scheduling
- **Azure Infrastructure**: AKS, ACR, VNet, Storage
- **CI/CD**: GitHub Actions for automation

## Prerequisites

- Azure subscription
- GitHub repository
- Terraform
- Docker
- Helm

## Setup

1. Clone the repository
2. Set up Azure credentials as GitHub secrets
3. Run Terraform to provision infrastructure
4. Build and push Docker images
5. Deploy to AKS using Helm

## Accessing the Application

After deployment, the application will be accessible via the ingress controller's public IP.

## Development

- Patient Service: `/patients`
- Appointment Service: `/appointments`