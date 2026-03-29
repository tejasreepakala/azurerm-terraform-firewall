
variable "firewall_name" {
  type        = string
  description = "Base name for the firewall"
}

variable "resource_group_name" {
  type        = string
  description = "Base name for the resource group"
}

variable "location" {
  type        = string
  default     = "Central India"
}

variable "subnet_id" {
  type        = string
  description = "The Azure ID for AzureFirewallSubnet"
}

variable "public_ip_id" {
  type        = string
  description = "The Azure ID for the Firewall Public IP"
}


variable "network_rule_collections" {
  description = "Map of network rules for the firewall"
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
  description = "Map of application rules for the firewall"
  type = map(object({
    priority = number
    action   = string
    rules = list(object({
      name              = string
      source_addresses  = list(string)
      destination_fqdns = list(string)
      protocol_type     = string
      protocol_port     = number
    }))
  }))
  default = {}
}