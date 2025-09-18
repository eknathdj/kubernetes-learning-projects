variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "cluster_name" { type = string }
variable "vnet_subnet_id" { type = string }
variable "acr_id" { type = string }
variable "node_count" { type = number default = 2 }
variable "node_vm_size" { type = string default = "Standard_DS2_v2" }
