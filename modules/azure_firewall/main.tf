resource "azurerm_resource_group" "fw_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_firewall_policy" "firewall_policy" {
  name                = "${var.firewall_name}-policy"
  resource_group_name = azurerm_resource_group.fw_rg.name
  location            = azurerm_resource_group.fw_rg.location
  sku                 = "Standard"
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  location            = azurerm_resource_group.fw_rg.location
  resource_group_name = azurerm_resource_group.fw_rg.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  firewall_policy_id  = azurerm_firewall_policy.firewall_policy.id

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_id
  }
}