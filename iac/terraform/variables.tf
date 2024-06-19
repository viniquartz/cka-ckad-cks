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

variable "vm_cluster" {
  default = {
    vm_name = "cka-cluster",
    vm_size = "Standard_B2ms",
  }
}

variable "vm_node" {
  default = {
    vm_name = "cka-node",
    vm_size = "Standard_B2ms",
  }
}