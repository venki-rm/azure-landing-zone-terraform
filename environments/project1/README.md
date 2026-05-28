# Project 1: Minimal Azure Landing Zone

A beginner-friendly Terraform configuration that deploys a minimal but production-ready Azure landing zone.

## What Gets Deployed

- **Resource Group**: Container for all resources
- **Virtual Network (VNet)**: 10.0.0.0/16 address space
- **Subnet**: 10.0.1.0/24 for management resources
- **Storage Account**: Standard LRS storage with globally unique name

## Architecture

```
Resource Group (rg-proj1-dev)
  ├─ Virtual Network (vnet-proj1-dev)
  │   └─ Subnet (subnet-management)
  └─ Storage Account (stproj1dev<random>)
```

## Prerequisites

1. **Azure CLI** installed and authenticated:
   ```bash
   az login
   ```

2. **Terraform** >= 1.0:
   ```bash
   terraform version
   ```

## Deployment Steps

### 1. Initialize Terraform

```bash
cd environments/project1
terraform init
```

### 2. Review Variables (Optional)

Edit `terraform.tfvars` to customize:
- `location`: Azure region (default: East US)
- `resource_group_name`: RG name (default: rg-proj1-dev)
- `vnet_name`: VNet name (default: vnet-proj1-dev)
- `subnet_name`: Subnet name (default: subnet-management)
- `storage_account_name`: Storage prefix (default: stproj1dev)

### 3. Plan and Review

```bash
terraform plan -var-file=terraform.tfvars
```

### 4. Deploy

```bash
terraform apply -var-file=terraform.tfvars
```

### 5. View Outputs

```bash
terraform output
```

## Outputs

After deployment, you'll get:
- `resource_group_id`: Resource Group ID
- `resource_group_name`: Resource Group name
- `vnet_id`: Virtual Network ID
- `vnet_name`: Virtual Network name
- `subnet_id`: Subnet ID
- `storage_account_id`: Storage Account ID
- `storage_account_name`: Storage Account name (with random suffix)

## Cleanup

To destroy all resources:

```bash
terraform destroy -var-file=terraform.tfvars
```

## File Structure

```
environments/project1/
├── main.tf              # Resource definitions
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── terraform.tfvars     # Variable values
└── README.md            # This file
```

## Modules Used

- `modules/resource_group` - Creates Azure Resource Group
- `modules/network` - Creates Virtual Network
- `modules/subnet` - Creates Subnet
- `modules/storage` - Creates Storage Account

## Key Features

✅ Minimal configuration (only core networking + storage)  
✅ Beginner-friendly code structure  
✅ Reusable modules  
✅ Production-ready defaults  
✅ Easy to extend with additional resources  
✅ Terraform validate passes  
✅ Clean terraform plan output  

## Cost Estimate

Monthly cost is minimal:
- Resource Group: Free
- VNet: Free (first 50 peerings)
- Subnet: Free
- Storage Account: ~$0.023/GB for storage + transaction costs

## Next Steps

Once deployed, you can:
1. Add VMs to the subnet
2. Add NSGs for network security
3. Deploy applications to the subnet
4. Add additional subnets for different workloads
5. Implement monitoring and logging

## Troubleshooting

**Error: Storage account name already exists**
- Storage account names must be globally unique across all Azure. Edit `terraform.tfvars` and change `storage_account_name` to something unique like `stproj1dev001`, `stproj1dev2024`, etc.

**Error: Subscription has quota issues**
- Ensure your Azure subscription has sufficient quota in the selected region.

**terraform init fails**
- Make sure you're in the `environments/project1/` directory.
- Ensure the modules exist in `../../modules/`.
- Check your internet connection (Terraform needs to download Azure provider).

## Support

For issues or questions:
1. Review module code in `../../modules/`
2. Check Azure Terraform provider docs: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
3. Run `terraform validate` to check syntax
