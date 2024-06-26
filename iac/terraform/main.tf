module "rg" {
  source       = "./modules/rg"
  name_project = var.name_project
  location     = var.location
}

module "network" {
  source              = "./modules/network"
  name_project        = var.name_project
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  depends_on = [
    module.rg
  ]
}

module "compute" {
  source = "./modules/compute"

  vm_name_cluster     = var.vm_cluster.vm_name
  vm_size_cluster     = var.vm_cluster.vm_size
  vm_name_node        = var.vm_node.vm_name
  vm_size_node        = var.vm_node.vm_size
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  sg_id               = module.network.sg_id
  depends_on = [
    module.rg, module.network
  ]
}