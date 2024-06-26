resource "azurerm_public_ip" "cluster" {
  name                = "${var.vm_name_cluster}-publicip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "cluster" {
  name                = "${var.vm_name_cluster}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_name_cluster}-internal"
    subnet_id                     = var.subnet_id
    public_ip_address_id = azurerm_public_ip.cluster.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "cluster" {
  network_interface_id      = azurerm_network_interface.cluster.id
  network_security_group_id = var.sg_id
}

resource "azurerm_linux_virtual_machine" "cluster" {
  name                  = "${var.vm_name_cluster}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.cluster.id]
  size               = var.vm_size_cluster
  admin_username = "azureuser"
  computer_name  = "cka-cluster"
 
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/viniquartz.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  os_disk {
    name              = "${var.vm_name_cluster}-os_disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

# Node
resource "azurerm_public_ip" "node" {
  name                = "${var.vm_name_node}-publicip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "node" {
  name                = "${var.vm_name_node}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_name_node}-internal"
    subnet_id                     = var.subnet_id
    public_ip_address_id = azurerm_public_ip.node.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "node" {
  network_interface_id      = azurerm_network_interface.node.id
  network_security_group_id = var.sg_id
}

resource "azurerm_linux_virtual_machine" "node" {
  name                  = "${var.vm_name_node}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.node.id]
  size               = var.vm_size_node
  admin_username = "azureuser"
  computer_name  = "cka-node"
 
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/viniquartz.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  os_disk {
    name              = "${var.vm_name_node}-os_disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

# # resource "azurerm_ssh_public_key" "main" {
#   name                = "cka"
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   public_key          = file("~/.ssh/viniquartz.pub")
# }