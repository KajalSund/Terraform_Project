# Terraform-Based Azure Infrastructure Deployment

This project provisions a complete Azure infrastructure using Terraform with a modular architecture. It supports scalable Linux and Windows virtual machine deployments along with networking, storage, load balancing, and monitoring resources. The solution is built to be reusable, parameterized, and non-interactive.

## Project Features

- Modularized Terraform structure for maintainability and reuse
- Remote backend configuration for centralized state management
- Scalable infrastructure:
  - Linux VMs provisioned using `for_each`
  - Windows VMs provisioned using `count`
- Availability sets for high availability
- Use of locals for dynamic tagging and consistent naming
- Provisioners to display hostnames after VM creation
- Outputs for all critical resources
- 100% non-interactive and reproducible provisioning

## Resources Created

- Resource Group
- Virtual Network and Subnets
- Linux and Windows Virtual Machines
- Public and Private IPs
- FQDNs and Hostnames
- Load Balancer
- Data Disks for Linux VMs
- Azure SQL Database
- Storage Account and Recovery Services Vault
- Log Analytics Workspace


## Getting Started

### Prerequisites

- Azure CLI configured
- Terraform installed (v1.3.0 or newer)
- Active Azure subscription

### Usage

1. Clone the repository:
git clone https://github.com/KajalSund/Terraform_Project.git
cd Terraform_Project

2. Initialize Terraform:
terraform init

3. Review the execution plan:
terraform plan

4. Apply the configuration:
terraform apply

5. To destroy the infrastructure:
terraform destroy


## Outputs

Terraform will output the following after successful deployment:

- Hostnames and FQDNs for Linux and Windows VMs
- Private and public IPs
- VNet, Subnets, Load Balancer name
- Database, Recovery Vault, Storage Account, Log Analytics Workspace

## Learnings and Highlights

- Gained practical experience with modular Terraform
- Designed scalable infrastructure using advanced techniques (`for_each`, `count`, `locals`)
- Applied DevOps principles with reusable and secure infrastructure as code
- Developed cloud-native architecture aligned with real-world deployment patterns
