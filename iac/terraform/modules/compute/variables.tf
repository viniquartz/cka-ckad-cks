variable "resource_group_name" {
  default = ""
}

variable "location" {
  default = ""
}

#module network
variable "subnet_id" {
  default = ""
}

variable "subnet_name" {
  default = ""
}

variable "sg_id" {
  default = ""
}

#module compute
variable "vm_name_cluster" {
  default = ""
}

variable "vm_size_cluster" {
  default = ""
}

variable "vm_name_node" {
  default = ""
}

variable "vm_size_node" {
  default = ""
}

