resource "azurerm_firewall_policy_rule_collection_group" "firewall_rules" {
  name               = "fw-policy-rule-group"
  firewall_policy_id = azurerm_firewall_policy.firewall_policy.id
  priority           = 100

  # NETWORK RULES (IP/Port based)
  dynamic "network_rule_collection" {
    for_each = var.network_rule_collections
    content {
      name     = network_rule_collection.key
      priority = network_rule_collection.value.priority
      action   = network_rule_collection.value.action
      dynamic "rule" {
        for_each = network_rule_collection.value.rules
        content {
          name                  = rule.value.name
          protocols             = rule.value.protocols
          source_addresses      = rule.value.source_addresses
          destination_addresses = rule.value.destination_addresses
          destination_ports     = rule.value.destination_ports
        }
      }
    }
  }

  # APPLICATION RULES (FQDN based)
  dynamic "application_rule_collection" {
    for_each = var.app_rule_collections
    content {
      name     = application_rule_collection.key
      priority = application_rule_collection.value.priority
      action   = application_rule_collection.value.action
      dynamic "rule" {
        for_each = application_rule_collection.value.rules
        content {
          name             = rule.value.name
          source_addresses = rule.value.source_addresses
          destination_fqdns = rule.value.destination_fqdns
          protocols {
            type = rule.value.protocol_type
            port = rule.value.protocol_port
          }
        }
      }
    }
  }
}