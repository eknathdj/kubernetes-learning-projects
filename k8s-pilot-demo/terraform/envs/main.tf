# Root terraform that calls modules. Fill variable values in dev.tfvars (or override).
module "network" {
  source              = "../modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = "${var.cluster_name}-vnet"
  address_space       = ["10.1.0.0/16"]
  subnet_name         = "${var.cluster_name}-subnet"
  subnet_prefixes     = ["10.1.0.0/24"]
}

module "acr" {
  source              = "../modules/acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  acr_name            = "${var.cluster_name}acr"
  sku                 = "Standard"
}

module "keyvault" {
  source              = "../modules/keyvault"
  resource_group_name = var.resource_group_name
  location            = var.location
  keyvault_name       = "${var.cluster_name}-kv"
}

module "aks" {
  source              = "../modules/aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.cluster_name
  vnet_subnet_id      = module.network.subnet_id
  acr_id              = module.acr.acr_id
}

output "kubeconfig_command" {
  value = "az aks get-credentials -g ${var.resource_group_name} -n ${module.aks.cluster_name}"
}
