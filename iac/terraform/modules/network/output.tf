output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet1.id
}

output "subnet_name" {
  value = azurerm_subnet.subnet1.name
}

output "sg_id" {
  value = azurerm_network_security_group.main.id
}