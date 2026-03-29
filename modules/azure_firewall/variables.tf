variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region (e.g., Central India)"
}

variable "firewall_name" {
  type        = string
  description = "Name of the Azure Firewall"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the AzureFirewallSubnet"
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the Public IP for the Firewall"
}

variable "network_rule_collections" {
  description = "Map of network rule collections (IP/Port based)"
  type = map(object({
    priority = number
    action   = string
    rules = list(object({
      name                  = string
      protocols             = list(string)
      source_addresses      = list(string)
      destination_addresses = list(string)
      destination_ports     = list(string)
    }))
  }))
  default = {}
}

variable "app_rule_collections" {
  description = "Map of application rule collections (FQDN based)"
  type = map(object({
    priority = number
    action   = string
    rules = list(object({
      name              = string
      source_addresses  = list(string)
      destination_fqdns = list(string)
      protocol_type     = string # Usually "Http" or "Https"
      protocol_port     = number # Usually 80 or 443
    }))
  }))
  default = {}
}