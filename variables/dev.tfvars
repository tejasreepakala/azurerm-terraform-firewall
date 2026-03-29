# Network Rules: IP and Port based
network_rule_collections = {
  "Dev-Web-Traffic" = {
    priority = 1000
    action   = "Allow"
    rules = [
      {
        name                  = "Allow-Internal-HTTP"
        protocols             = ["TCP"]
        source_addresses      = ["10.10.1.0/24"] # Dev Subnet
        destination_addresses = ["10.10.2.50"]
        destination_ports     = ["80", "8080"]
      }
    ]
  }
}

# Application Rules: FQDN based
app_rule_collections = {
  "Dev-External-Access" = {
    priority = 1100
    action   = "Allow"
    rules = [
      {
        name              = "Allow-Apt-Get"
        source_addresses  = ["10.10.1.0/24"]
        destination_fqdns = ["*.ubuntu.com", "azure.archive.ubuntu.com"]
        protocol_type     = "Http"
        protocol_port     = 80
      }
    ]
  }
}