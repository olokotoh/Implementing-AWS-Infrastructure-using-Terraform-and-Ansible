#!/bin/bash

# Run Terraform
terraform apply -auto-approve

# Check if Terraform was successful
if [ $? -eq 0 ]; then
  echo "Terraform provisioning successful."

  # Output the IP addresses of the instances to a file
  terraform output -json > output.json
  # Extract the IP addresses from the output file and write them to the inventory file
  jq -r '.public_ip_addresses.value[]' output.json > inventory

  # Run Ansible command
  ansible-playbook -i inventory playbook.yml
else
  echo "Terraform provisioning failed."
  exit 1
fi
