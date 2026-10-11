output "network_services_edge_cache_services_id" {
  description = "Map of id values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no id are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.id if v.id != null && length(v.id) > 0 }
}
output "network_services_edge_cache_services_deletion_policy" {
  description = "Map of deletion_policy values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no deletion_policy are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "network_services_edge_cache_services_description" {
  description = "Map of description values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no description are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.description if v.description != null && length(v.description) > 0 }
}
output "network_services_edge_cache_services_disable_http2" {
  description = "Map of disable_http2 values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no disable_http2 are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.disable_http2 if v.disable_http2 != null }
}
output "network_services_edge_cache_services_disable_quic" {
  description = "Map of disable_quic values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no disable_quic are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.disable_quic if v.disable_quic != null }
}
output "network_services_edge_cache_services_edge_security_policy" {
  description = "Map of edge_security_policy values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no edge_security_policy are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.edge_security_policy if v.edge_security_policy != null && length(v.edge_security_policy) > 0 }
}
output "network_services_edge_cache_services_edge_ssl_certificates" {
  description = "Map of edge_ssl_certificates values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no edge_ssl_certificates are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.edge_ssl_certificates if v.edge_ssl_certificates != null && length(v.edge_ssl_certificates) > 0 }
}
output "network_services_edge_cache_services_effective_labels" {
  description = "Map of effective_labels values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no effective_labels are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "network_services_edge_cache_services_ipv4_addresses" {
  description = "Map of ipv4_addresses values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no ipv4_addresses are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.ipv4_addresses if v.ipv4_addresses != null && length(v.ipv4_addresses) > 0 }
}
output "network_services_edge_cache_services_ipv6_addresses" {
  description = "Map of ipv6_addresses values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no ipv6_addresses are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.ipv6_addresses if v.ipv6_addresses != null && length(v.ipv6_addresses) > 0 }
}
output "network_services_edge_cache_services_labels" {
  description = "Map of labels values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no labels are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "network_services_edge_cache_services_log_config" {
  description = "Map of log_config values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no log_config are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => one(v.log_config) if v.log_config != null && length(v.log_config) > 0 }
}
output "network_services_edge_cache_services_name" {
  description = "Map of name values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no name are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.name if v.name != null && length(v.name) > 0 }
}
output "network_services_edge_cache_services_project" {
  description = "Map of project values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no project are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.project if v.project != null && length(v.project) > 0 }
}
output "network_services_edge_cache_services_require_tls" {
  description = "Map of require_tls values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no require_tls are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.require_tls if v.require_tls != null }
}
output "network_services_edge_cache_services_routing" {
  description = "Map of routing values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no routing are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => one(v.routing) if v.routing != null && length(v.routing) > 0 }
}
output "network_services_edge_cache_services_ssl_policy" {
  description = "Map of ssl_policy values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no ssl_policy are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.ssl_policy if v.ssl_policy != null && length(v.ssl_policy) > 0 }
}
output "network_services_edge_cache_services_terraform_labels" {
  description = "Map of terraform_labels values across all network_services_edge_cache_services, keyed the same as var.network_services_edge_cache_services except keys with no terraform_labels are omitted"
  value       = { for k, v in google_network_services_edge_cache_service.network_services_edge_cache_services : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}

