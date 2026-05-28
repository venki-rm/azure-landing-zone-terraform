# Azure Landing Zone Terraform

This repository contains a minimal Azure landing zone example built with Terraform.

## What this repository includes

- `main.tf` — root Terraform configuration for provider requirements
- `variables.tf` — common input variables for the root module
- `modules/` — reusable Terraform modules:
  - `resource_group`
  - `network`
  - `subnet`
  - `storage`
- `environments/project1/` — deployment entrypoint for the minimal landing zone
  - `main.tf`
  - `variables.tf`
  - `outputs.tf`
  - `terraform.tfvars`
  - `README.md`

## Project 1: Minimal Azure Landing Zone

This environment deploys only the core Azure resources required for a minimal landing zone:

- Azure Resource Group
- Virtual Network (10.0.0.0/16)
- Subnet (10.0.1.0/24)
- Storage Account (Standard_LRS)

## Getting started

### 1. Initialize Terraform

```powershell
cd c:\AzureTerraformProjects\azure-landing-zone-terraform\environments\project1
terraform init
```

### 2. Review variables

Edit `terraform.tfvars` to change values such as:

- `location`
- `resource_group_name`
- `vnet_name`
- `subnet_name`
- `storage_account_name`

### 3. Plan

```powershell
terraform plan -var-file=terraform.tfvars
```

### 4. Apply

```powershell
terraform apply -var-file=terraform.tfvars
```

## Notes

- `terraform validate` is safe and does not deploy resources.
- `terraform plan` previews changes without creating resources.
- Only `terraform apply` actually deploys to Azure.

## GitHub

This repository is linked to `git@github.com:venki-rm/azure-landing-zone-terraform.git`.

If you want to continue later, reopen the folder and run the Terraform commands from the `environments/project1` directory.
