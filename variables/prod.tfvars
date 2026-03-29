# Network Rules: IP and Port based
network_rule_collections = {
  "Prod-DB-Traffic" = {
    priority = 2000
    action   = "Allow"
    rules = [
      {
        name                  = "Allow-App-To-SQL"
        protocols             = ["TCP"]
        source_addresses      = ["10.20.1.0/24"] # Prod Subnet
        destination_addresses = ["10.20.5.10"]
        destination_ports     = ["1433"]
      }
    ]
  }
}

# Application Rules: FQDN based
app_rule_collections = {
  "Prod-Global-Allow" = {
    priority = 2100
    action   = "Allow"
    rules = [
      {
        name              = "Allow-Azure-Monitor"
        source_addresses  = ["*"]
        destination_fqdns = ["dc.services.visualstudio.com", "*.livedata.monitor.azure.com"]
        protocol_type     = "Https"
        protocol_port     = 443
      }
    ]
  }
}