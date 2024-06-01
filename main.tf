provider "azurerm" {
  features = {}
}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = "myResourceGroup"
  location = "east US 2"
}

# Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = "myVnet"
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
}

# Subnet
resource "azurerm_subnet" "example" {
  name                 = "mySubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Security Group
resource "azurerm_network_security_group" "example" {
  name                = "myNSG"
  resource_group_name = azurerm_resource_group.example.name
}

# Associate NSG with Subnet
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}
