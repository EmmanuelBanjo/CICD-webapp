#!/bin/bash
echo "Initializing Terraform..."
terraform init
terraform apply -auto-approve
