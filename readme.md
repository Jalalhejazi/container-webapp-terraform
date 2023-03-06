
## Run IaC ?

```powershell
# IaC initialize the automation 
terraform init

# (optional) make a plan before deployment to see additional default settings assigned
terraform plan

# BigBang Deployment | Rolling Update Deployment 
terraform apply    -auto-approve


# EndOfLife Deployment
terraform destroy  -auto-approve
```

## List of Azure App Services (SKU sizes)
```
Free Tier → F1
Shared Tier → D1
------------------------------------------------------
Basic Tier → B1, B2, B3 (Basic Small, Medium, Large)
-----------------------------------------------------
Standard Tier → S1, S2, S3 (Small, Medium, Large)
PremiumV2 Tier → P1v2, P2v2, P3v2 (Small, Medium, Large)

```

## Comparing Terraform with Bicep 

- https://learn.microsoft.com/en-us/azure/developer/terraform/comparing-terraform-and-bicep?tabs=comparing-bicep-terraform-integration-features





## Troubleshouting 
- https://www.padok.fr/en/blog/terraform-azure-app-docker
- https://discuss.hashicorp.com/t/azurerm-linux-web-app-cannot-create-docker-web-app-the-parameter-linuxfxversion-has-an-invalid-value/41649