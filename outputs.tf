output "inventory_info" {
  description = "Inventory created for this AAP demo"
  value = {
    id           = aap_inventory.my_inventory.id
    name         = aap_inventory.my_inventory.name
    organization = aap_inventory.my_inventory.organization
    url          = aap_inventory.my_inventory.url
  }
}

output "group_info" {
  description = "Group created in the demo inventory"
  value = {
    id           = aap_group.my_group.id
    name         = aap_group.my_group.name
    inventory_id = aap_group.my_group.inventory_id
    url          = aap_group.my_group.url
  }
}

output "host_info" {
  description = "Host created in the demo inventory"
  value = {
    id           = aap_host.my_host.id
    name         = aap_host.my_host.name
    inventory_id = aap_host.my_host.inventory_id
    enabled      = aap_host.my_host.enabled
    url          = aap_host.my_host.url
  }
}

locals {
  aap_base_url = var.aap_host
}

output "topology" {
  description = "Simple AAP topology for this demo: inventory -> group -> host"
  value = {
    inventory = {
      id       = aap_inventory.my_inventory.id
      name     = aap_inventory.my_inventory.name
      api_path = aap_inventory.my_inventory.url
      full_url = "${local.aap_base_url}${aap_inventory.my_inventory.url}"
    }
    group = {
      id           = aap_group.my_group.id
      name         = aap_group.my_group.name
      inventory_id = aap_group.my_group.inventory_id
      api_path     = aap_group.my_group.url
      full_url     = "${local.aap_base_url}${aap_group.my_group.url}"
    }
    host = {
      id           = aap_host.my_host.id
      name         = aap_host.my_host.name
      inventory_id = aap_host.my_host.inventory_id
      enabled      = aap_host.my_host.enabled
      api_path     = aap_host.my_host.url
      full_url     = "${local.aap_base_url}${aap_host.my_host.url}"
    }
  }
}
