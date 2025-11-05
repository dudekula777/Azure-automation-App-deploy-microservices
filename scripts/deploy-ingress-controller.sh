#!/bin/bash

# Deploy NGINX Ingress Controller
set -e

echo "=== Deploying NGINX Ingress Controller ==="

# Deploy ingress-nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/cloud/deploy.yaml

# Wait for ingress controller to be ready
echo "Waiting for ingress controller to be ready..."
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=300s

# Get the external IP
echo "Getting ingress controller external IP..."
EXTERNAL_IP=$(kubectl get service ingress-nginx-controller -n ingress-nginx -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

while [ -z "$EXTERNAL_IP" ]; do
    echo "Waiting for external IP assignment..."
    sleep 10
    EXTERNAL_IP=$(kubectl get service ingress-nginx-controller -n ingress-nginx -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
done

echo ""
echo "=== INGRESS CONTROLLER DEPLOYED ==="
echo "External IP: $EXTERNAL_IP"
echo ""
echo "You can now update your DNS records to point to this IP address."
echo "Update the host in kubernetes/helm/values.yaml to use this IP or your domain."