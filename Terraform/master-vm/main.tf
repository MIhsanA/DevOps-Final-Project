resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.resourcegrp_location
  resource_group_name = var.resourcegrp_name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = var.resourcegrp_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = var.resourcegrp_location
  resource_group_name = var.resourcegrp_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.tfpublicip.id
}
}
resource "azurerm_public_ip" "tfpublicip" {
  name                         = "PIP1"
  location                     = "uk south"
  resource_group_name          = var.resourcegrp_name
  allocation_method  = "Static"

  tags = {
    environment = "testing"
  }

}

data "template_file" "cloudconfig" {
  tmp1 = "${file("~/{path}/tmp1.tpl")}"
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloudconfig.rendered}"
  }
}

# Create virtual machine
resource "azurerm_virtual_machine" "terraformvm" {
  name                  = "TF-VM"
  location              = "uksouth"
  resource_group_name   = var.resourcegrp_name
  network_interface_ids = ["${azurerm_network_interface.main.id}"]
  vm_size               = "Standard_B1s"

  identity {
    type = "SystemAssigned"
  }

  storage_os_disk {
    name              = "myOsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "TF-VM"
    admin_username = "azureuser"
    admin_password = "PA$$pa$$word"
    custom_data    = "${data.template_cloudinit_config.config.rendered}"
  }

  tags = {
    environment = "testing"
  }

  os_profile_linux_config {
    disable_password_authentication = false

}
}
data "azurerm_subnet" "azsubnet" {
    name = azurerm_subnet.internal.name
    resource_group_name = var.resourcegrp_name
    virtual_network_name = azurerm_virtual_network.main.name
}

