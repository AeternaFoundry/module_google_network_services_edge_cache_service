variable "network_services_edge_cache_services" {
  description = <<EOT
Map of network_services_edge_cache_services, attributes below
Required:
    - name
    - routing (block):
        - host_rule (required, block):
            - description (optional)
            - hosts (required)
            - path_matcher (required)
        - path_matcher (required, block):
            - description (optional)
            - name (required)
            - route_rule (required, block):
                - description (optional)
                - header_action (optional, block):
                    - request_header_to_add (optional, block):
                        - header_name (required)
                        - header_value (required)
                        - replace (optional)
                    - request_header_to_remove (optional, block):
                        - header_name (required)
                    - response_header_to_add (optional, block):
                        - header_name (required)
                        - header_value (required)
                        - replace (optional)
                    - response_header_to_remove (optional, block):
                        - header_name (required)
                - match_rule (required, block):
                    - full_path_match (optional)
                    - header_match (optional, block):
                        - exact_match (optional)
                        - header_name (required)
                        - invert_match (optional)
                        - prefix_match (optional)
                        - present_match (optional)
                        - suffix_match (optional)
                    - ignore_case (optional)
                    - path_template_match (optional)
                    - prefix_match (optional)
                    - query_parameter_match (optional, block):
                        - exact_match (optional)
                        - name (required)
                        - present_match (optional)
                - origin (optional)
                - priority (required)
                - route_action (optional, block):
                    - cdn_policy (optional, block):
                        - add_signatures (optional, block):
                            - actions (required)
                            - copied_parameters (optional)
                            - keyset (optional)
                            - token_query_parameter (optional)
                            - token_ttl (optional)
                        - cache_key_policy (optional, block):
                            - exclude_host (optional)
                            - exclude_query_string (optional)
                            - excluded_query_parameters (optional)
                            - include_protocol (optional)
                            - included_cookie_names (optional)
                            - included_header_names (optional)
                            - included_query_parameters (optional)
                        - cache_mode (optional)
                        - client_ttl (optional)
                        - default_ttl (optional)
                        - max_ttl (optional)
                        - negative_caching (optional)
                        - negative_caching_policy (optional)
                        - signed_request_keyset (optional)
                        - signed_request_maximum_expiration_ttl (optional)
                        - signed_request_mode (optional)
                        - signed_token_options (optional, block):
                            - allowed_signature_algorithms (optional)
                            - token_query_parameter (optional)
                    - compression_mode (optional)
                    - cors_policy (optional, block):
                        - allow_credentials (optional)
                        - allow_headers (optional)
                        - allow_methods (optional)
                        - allow_origins (optional)
                        - disabled (optional)
                        - expose_headers (optional)
                        - max_age (required)
                    - url_rewrite (optional, block):
                        - host_rewrite (optional)
                        - path_prefix_rewrite (optional)
                        - path_template_rewrite (optional)
                - route_methods (optional, block):
                    - allowed_methods (optional)
                - url_redirect (optional, block):
                    - host_redirect (optional)
                    - https_redirect (optional)
                    - path_redirect (optional)
                    - prefix_redirect (optional)
                    - redirect_response_code (optional)
                    - strip_query (optional)
Optional:
    - deletion_policy
    - description
    - disable_http2
    - disable_quic
    - edge_security_policy
    - edge_ssl_certificates
    - labels
    - project
    - require_tls
    - ssl_policy
    - log_config (block):
        - enable (optional)
        - sample_rate (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name                  = string
    deletion_policy       = optional(string)
    description           = optional(string)
    disable_http2         = optional(bool)
    disable_quic          = optional(bool)
    edge_security_policy  = optional(string)
    edge_ssl_certificates = optional(list(string))
    labels                = optional(map(string))
    project               = optional(string)
    require_tls           = optional(bool)
    ssl_policy            = optional(string)
    routing = object({
      host_rule = list(object({
        description  = optional(string)
        hosts        = list(string)
        path_matcher = string
      }))
      path_matcher = list(object({
        description = optional(string)
        name        = string
        route_rule = list(object({
          description = optional(string)
          header_action = optional(object({
            request_header_to_add = optional(list(object({
              header_name  = string
              header_value = string
              replace      = optional(bool)
            })))
            request_header_to_remove = optional(list(object({
              header_name = string
            })))
            response_header_to_add = optional(list(object({
              header_name  = string
              header_value = string
              replace      = optional(bool)
            })))
            response_header_to_remove = optional(list(object({
              header_name = string
            })))
          }))
          match_rule = list(object({
            full_path_match = optional(string)
            header_match = optional(list(object({
              exact_match   = optional(string)
              header_name   = string
              invert_match  = optional(bool)
              prefix_match  = optional(string)
              present_match = optional(bool)
              suffix_match  = optional(string)
            })))
            ignore_case         = optional(bool)
            path_template_match = optional(string)
            prefix_match        = optional(string)
            query_parameter_match = optional(list(object({
              exact_match   = optional(string)
              name          = string
              present_match = optional(bool)
            })))
          }))
          origin   = optional(string)
          priority = string
          route_action = optional(object({
            cdn_policy = optional(object({
              add_signatures = optional(object({
                actions               = list(string)
                copied_parameters     = optional(list(string))
                keyset                = optional(string)
                token_query_parameter = optional(string)
                token_ttl             = optional(string)
              }))
              cache_key_policy = optional(object({
                exclude_host              = optional(bool)
                exclude_query_string      = optional(bool)
                excluded_query_parameters = optional(list(string))
                include_protocol          = optional(bool)
                included_cookie_names     = optional(list(string))
                included_header_names     = optional(list(string))
                included_query_parameters = optional(list(string))
              }))
              cache_mode                            = optional(string)
              client_ttl                            = optional(string)
              default_ttl                           = optional(string)
              max_ttl                               = optional(string)
              negative_caching                      = optional(bool)
              negative_caching_policy               = optional(map(string))
              signed_request_keyset                 = optional(string)
              signed_request_maximum_expiration_ttl = optional(string)
              signed_request_mode                   = optional(string)
              signed_token_options = optional(object({
                allowed_signature_algorithms = optional(list(string))
                token_query_parameter        = optional(string)
              }))
            }))
            compression_mode = optional(string)
            cors_policy = optional(object({
              allow_credentials = optional(bool)
              allow_headers     = optional(list(string))
              allow_methods     = optional(list(string))
              allow_origins     = optional(list(string))
              disabled          = optional(bool)
              expose_headers    = optional(list(string))
              max_age           = string
            }))
            url_rewrite = optional(object({
              host_rewrite          = optional(string)
              path_prefix_rewrite   = optional(string)
              path_template_rewrite = optional(string)
            }))
          }))
          route_methods = optional(object({
            allowed_methods = optional(list(string))
          }))
          url_redirect = optional(object({
            host_redirect          = optional(string)
            https_redirect         = optional(bool)
            path_redirect          = optional(string)
            prefix_redirect        = optional(string)
            redirect_response_code = optional(string)
            strip_query            = optional(bool)
          }))
        }))
      }))
    })
    log_config = optional(object({
      enable      = optional(bool)
      sample_rate = optional(number)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.network_services_edge_cache_services : (
        length(v.routing.host_rule) >= 1 && length(v.routing.host_rule) <= 50
      )
    ])
    error_message = "Each host_rule list must contain between 1 and 50 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_services_edge_cache_services : (
        length(v.routing.path_matcher) >= 1 && length(v.routing.path_matcher) <= 50
      )
    ])
    error_message = "Each path_matcher list must contain between 1 and 50 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_services_edge_cache_services : (
        alltrue([for item in v.routing.path_matcher : (length(item.route_rule) >= 1 && length(item.route_rule) <= 200)])
      )
    ])
    error_message = "Each route_rule list must contain between 1 and 200 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_services_edge_cache_services : (
        alltrue([for item in v.routing.path_matcher : (alltrue([for item in item.route_rule : (item.header_action == null || (item.header_action.request_header_to_add == null || (length(item.header_action.request_header_to_add) <= 25)))]))])
      )
    ])
    error_message = "Each request_header_to_add list must contain at most 25 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_services_edge_cache_services : (
        alltrue([for item in v.routing.path_matcher : (alltrue([for item in item.route_rule : (item.header_action == null || (item.header_action.request_header_to_remove == null || (length(item.header_action.request_header_to_remove) <= 25)))]))])
      )
    ])
    error_message = "Each request_header_to_remove list must contain at most 25 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_services_edge_cache_services : (
        alltrue([for item in v.routing.path_matcher : (alltrue([for item in item.route_rule : (item.header_action == null || (item.header_action.response_header_to_add == null || (length(item.header_action.response_header_to_add) <= 25)))]))])
      )
    ])
    error_message = "Each response_header_to_add list must contain at most 25 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_services_edge_cache_services : (
        alltrue([for item in v.routing.path_matcher : (alltrue([for item in item.route_rule : (item.header_action == null || (item.header_action.response_header_to_remove == null || (length(item.header_action.response_header_to_remove) <= 25)))]))])
      )
    ])
    error_message = "Each response_header_to_remove list must contain at most 25 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_services_edge_cache_services : (
        alltrue([for item in v.routing.path_matcher : (alltrue([for item in item.route_rule : (length(item.match_rule) >= 1 && length(item.match_rule) <= 5)]))])
      )
    ])
    error_message = "Each match_rule list must contain between 1 and 5 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_services_edge_cache_services : (
        alltrue([for item in v.routing.path_matcher : (alltrue([for item in item.route_rule : (alltrue([for item in item.match_rule : (item.header_match == null || (length(item.header_match) <= 3))]))]))])
      )
    ])
    error_message = "Each header_match list must contain at most 3 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_services_edge_cache_services : (
        alltrue([for item in v.routing.path_matcher : (alltrue([for item in item.route_rule : (alltrue([for item in item.match_rule : (item.query_parameter_match == null || (length(item.query_parameter_match) <= 5))]))]))])
      )
    ])
    error_message = "Each query_parameter_match list must contain at most 5 items"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

