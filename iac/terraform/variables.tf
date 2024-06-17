variable "resource_group_name" {
  default = ""
}

variable "location" {
  default = ""
}

variable "name_project" {
  default = ""
}

#module network
variable "vnet_id" {
  default = ""
}

variable "vnet_name" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "subnet_name" {
  default = ""
}

variable "sg_id" {
  default = ""
}

variable "vms" {
  default = {
    vm_name       = "cka-cluster",
    vm_size       = "Standard_B2s",
    disk_capacity = 256
  }
}