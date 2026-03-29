module "azure_firewall" {
  source = "./modules/azure_firewall"

  firewall_name       = "${var.firewall_name}-${terraform.workspace}"
  resource_group_name = "${var.resource_group_name}-${terraform.workspace}"
  location            = var.location
  
  subnet_id    = var.subnet_id
  public_ip_id = var.public_ip_id

  network_rule_collections = var.network_rule_collections
  app_rule_collections     = var.app_rule_collections
}