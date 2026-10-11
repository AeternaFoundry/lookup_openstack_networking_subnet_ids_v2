data "openstack_networking_subnet_ids_v2" "networking_subnet_ids_v2_lookup" {
  for_each = var.networking_subnet_ids_v2_lookup

  cidr                 = each.value.cidr
  description          = each.value.description
  dhcp_enabled         = each.value.dhcp_enabled
  dns_publish_fixed_ip = each.value.dns_publish_fixed_ip
  gateway_ip           = each.value.gateway_ip
  ip_version           = each.value.ip_version
  ipv6_address_mode    = each.value.ipv6_address_mode
  ipv6_ra_mode         = each.value.ipv6_ra_mode
  name                 = each.value.name
  name_regex           = each.value.name_regex
  network_id           = each.value.network_id
  region               = each.value.region
  segment_id           = each.value.segment_id
  sort_direction       = each.value.sort_direction
  sort_key             = each.value.sort_key
  subnetpool_id        = each.value.subnetpool_id
  tags                 = each.value.tags
  tenant_id            = each.value.tenant_id
}

