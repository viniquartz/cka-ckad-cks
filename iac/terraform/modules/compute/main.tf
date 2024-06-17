resource "azurerm_public_ip" "main" {
  name                = "${var.vm_name}-publicip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_name}-internal"
    subnet_id                     = var.subnet_id
    public_ip_address_id = azurerm_public_ip.main.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = var.sg_id
}

resource "azurerm_ssh_public_key" "main" {
  name                = "cka-cluster"
  resource_group_name = var.resource_group_name
  location            = var.location
  public_key          = file("~/.ssh/viniquartz.pub")
}

resource "azurerm_linux_virtual_machine" "main" {
  name                  = "${var.vm_name}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  size               = var.vm_size
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
    name              = "${var.vm_name}-os_disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}