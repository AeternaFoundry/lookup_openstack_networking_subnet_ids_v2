variable "networking_subnet_ids_v2_lookup" {
  description = <<EOT
Map of networking_subnet_ids_v2_lookup, attributes below
Optional:
    - cidr
    - description
    - dhcp_enabled
    - dns_publish_fixed_ip
    - gateway_ip
    - ip_version
    - ipv6_address_mode
    - ipv6_ra_mode
    - name
    - name_regex
    - network_id
    - region
    - segment_id
    - sort_direction
    - sort_key
    - subnetpool_id
    - tags
    - tenant_id
EOT

  type = map(object({
    cidr                 = optional(string)
    description          = optional(string)
    dhcp_enabled         = optional(bool)
    dns_publish_fixed_ip = optional(bool)
    gateway_ip           = optional(string)
    ip_version           = optional(number)
    ipv6_address_mode    = optional(string)
    ipv6_ra_mode         = optional(string)
    name                 = optional(string)
    name_regex           = optional(string)
    network_id           = optional(string)
    region               = optional(string)
    segment_id           = optional(string)
    sort_direction       = optional(string)
    sort_key             = optional(string)
    subnetpool_id        = optional(string)
    tags                 = optional(set(string))
    tenant_id            = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.networking_subnet_ids_v2_lookup : (
        v.ip_version == null || (contains([4, 6], v.ip_version))
      )
    ])
    error_message = "must be one of: 4, 6"
  }
  validation {
    condition = alltrue([
      for k, v in var.networking_subnet_ids_v2_lookup : (
        v.ipv6_address_mode == null || (contains(["slaac", "dhcpv6-stateful", "dhcpv6-stateless"], v.ipv6_address_mode))
      )
    ])
    error_message = "must be one of: \"slaac\", \"dhcpv6-stateful\", \"dhcpv6-stateless\""
  }
  validation {
    condition = alltrue([
      for k, v in var.networking_subnet_ids_v2_lookup : (
        v.ipv6_ra_mode == null || (contains(["slaac", "dhcpv6-stateful", "dhcpv6-stateless"], v.ipv6_ra_mode))
      )
    ])
    error_message = "must be one of: \"slaac\", \"dhcpv6-stateful\", \"dhcpv6-stateless\""
  }
  validation {
    condition = alltrue([
      for k, v in var.networking_subnet_ids_v2_lookup : (
        v.sort_direction == null || (contains([for v in ["asc", "desc"] : lower(v)], lower(v.sort_direction)))
      )
    ])
    error_message = "must be one of: \"asc\", \"desc\""
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

