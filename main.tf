resource "azurerm_resource_group" "terr_azure_rg" {
  name     = "terr_rg"
  location = var.location
}
resource "azurerm_virtual_network" "terr_azure_vn" {
  name                = "terr_network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terr_azure_rg.location
  resource_group_name = azurerm_resource_group.terr_azure_rg.name
}
resource "azurerm_subnet" "terr_azure_subnet" {
  name                 = "terr_subnet"
  resource_group_name  = azurerm_resource_group.terr_azure_rg.name
  virtual_network_name = azurerm_virtual_network.terr_azure_vn.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_network_security_group" "terr_azure_sg" {
  name                = "azure_sg"
  location            = azurerm_resource_group.terr_azure_rg.location
  resource_group_name = azurerm_resource_group.terr_azure_rg.name
security_rule {
    name                       = "allow_all_inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_all_outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "terr_azure_sgAssoc" {
  subnet_id                 = azurerm_subnet.terr_azure_subnet.id
  network_security_group_id = azurerm_network_security_group.terr_azure_sg.id
}
