# k8s-pilot-demo
Pilot migration demo repo: Terraform + AKS + Helm + CI (GitHub Actions) + Ansible skeleton

## What I added
- Complete Terraform module skeletons for network, ACR, KeyVault, and AKS (with role assignment for ACR pull).
- Helm chart with helpers and optional ingress template and values.
- Improved GitHub Actions workflow that builds, scans (Trivy), login to ACR, sets AKS context and deploys via Helm.
- Demo runbook and sample scripts.

## Next steps before running
1. Create an Azure Storage account and Terraform backend container and update `terraform/backend.tf` accordingly.
2. Replace placeholder names (resource group, storage acct, subscription) in dev.tfvars and backend.tf.
3. Create the resource group in Azure or add a Terraform module to create it.
4. Add GitHub Secrets: `REGISTRY`, `REGISTRY_USER`, `REGISTRY_PASS`, `AZURE_CREDENTIALS`, `AKS_NAME`, `RESOURCE_GROUP`.
5. Run `terraform init` then `terraform plan -var-file=terraform/envs/dev.tfvars`. Do **not** run `terraform apply` until you are ready.
