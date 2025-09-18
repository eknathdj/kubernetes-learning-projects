variable "vnet_subnet_id" { type = string }
variable "acr_id" { type = string }
variable "node_vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}
