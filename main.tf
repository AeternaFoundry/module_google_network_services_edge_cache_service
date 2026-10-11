resource "google_network_services_edge_cache_service" "network_services_edge_cache_services" {
  for_each = var.network_services_edge_cache_services

  name                  = each.value.name
  deletion_policy       = each.value.deletion_policy
  description           = each.value.description
  disable_http2         = each.value.disable_http2
  disable_quic          = each.value.disable_quic
  edge_security_policy  = each.value.edge_security_policy
  edge_ssl_certificates = each.value.edge_ssl_certificates
  labels                = each.value.labels
  project               = each.value.project
  require_tls           = each.value.require_tls
  ssl_policy            = each.value.ssl_policy

  routing {
    dynamic "host_rule" {
      for_each = each.value.routing.host_rule
      content {
        description  = host_rule.value.description
        hosts        = host_rule.value.hosts
        path_matcher = host_rule.value.path_matcher
      }
    }
    dynamic "path_matcher" {
      for_each = each.value.routing.path_matcher
      content {
        description = path_matcher.value.description
        name        = path_matcher.value.name
        dynamic "route_rule" {
          for_each = path_matcher.value.route_rule
          content {
            description = route_rule.value.description
            dynamic "header_action" {
              for_each = route_rule.value.header_action != null ? [route_rule.value.header_action] : []
              content {
                dynamic "request_header_to_add" {
                  for_each = header_action.value.request_header_to_add != null ? header_action.value.request_header_to_add : []
                  content {
                    header_name  = request_header_to_add.value.header_name
                    header_value = request_header_to_add.value.header_value
                    replace      = request_header_to_add.value.replace
                  }
                }
                dynamic "request_header_to_remove" {
                  for_each = header_action.value.request_header_to_remove != null ? header_action.value.request_header_to_remove : []
                  content {
                    header_name = request_header_to_remove.value.header_name
                  }
                }
                dynamic "response_header_to_add" {
                  for_each = header_action.value.response_header_to_add != null ? header_action.value.response_header_to_add : []
                  content {
                    header_name  = response_header_to_add.value.header_name
                    header_value = response_header_to_add.value.header_value
                    replace      = response_header_to_add.value.replace
                  }
                }
                dynamic "response_header_to_remove" {
                  for_each = header_action.value.response_header_to_remove != null ? header_action.value.response_header_to_remove : []
                  content {
                    header_name = response_header_to_remove.value.header_name
                  }
                }
              }
            }
            dynamic "match_rule" {
              for_each = route_rule.value.match_rule
              content {
                full_path_match = match_rule.value.full_path_match
                dynamic "header_match" {
                  for_each = match_rule.value.header_match != null ? match_rule.value.header_match : []
                  content {
                    exact_match   = header_match.value.exact_match
                    header_name   = header_match.value.header_name
                    invert_match  = header_match.value.invert_match
                    prefix_match  = header_match.value.prefix_match
                    present_match = header_match.value.present_match
                    suffix_match  = header_match.value.suffix_match
                  }
                }
                ignore_case         = match_rule.value.ignore_case
                path_template_match = match_rule.value.path_template_match
                prefix_match        = match_rule.value.prefix_match
                dynamic "query_parameter_match" {
                  for_each = match_rule.value.query_parameter_match != null ? match_rule.value.query_parameter_match : []
                  content {
                    exact_match   = query_parameter_match.value.exact_match
                    name          = query_parameter_match.value.name
                    present_match = query_parameter_match.value.present_match
                  }
                }
              }
            }
            origin   = route_rule.value.origin
            priority = route_rule.value.priority
            dynamic "route_action" {
              for_each = route_rule.value.route_action != null ? [route_rule.value.route_action] : []
              content {
                dynamic "cdn_policy" {
                  for_each = route_action.value.cdn_policy != null ? [route_action.value.cdn_policy] : []
                  content {
                    dynamic "add_signatures" {
                      for_each = cdn_policy.value.add_signatures != null ? [cdn_policy.value.add_signatures] : []
                      content {
                        actions               = add_signatures.value.actions
                        copied_parameters     = add_signatures.value.copied_parameters
                        keyset                = add_signatures.value.keyset
                        token_query_parameter = add_signatures.value.token_query_parameter
                        token_ttl             = add_signatures.value.token_ttl
                      }
                    }
                    dynamic "cache_key_policy" {
                      for_each = cdn_policy.value.cache_key_policy != null ? [cdn_policy.value.cache_key_policy] : []
                      content {
                        exclude_host              = cache_key_policy.value.exclude_host
                        exclude_query_string      = cache_key_policy.value.exclude_query_string
                        excluded_query_parameters = cache_key_policy.value.excluded_query_parameters
                        include_protocol          = cache_key_policy.value.include_protocol
                        included_cookie_names     = cache_key_policy.value.included_cookie_names
                        included_header_names     = cache_key_policy.value.included_header_names
                        included_query_parameters = cache_key_policy.value.included_query_parameters
                      }
                    }
                    cache_mode                            = cdn_policy.value.cache_mode
                    client_ttl                            = cdn_policy.value.client_ttl
                    default_ttl                           = cdn_policy.value.default_ttl
                    max_ttl                               = cdn_policy.value.max_ttl
                    negative_caching                      = cdn_policy.value.negative_caching
                    negative_caching_policy               = cdn_policy.value.negative_caching_policy
                    signed_request_keyset                 = cdn_policy.value.signed_request_keyset
                    signed_request_maximum_expiration_ttl = cdn_policy.value.signed_request_maximum_expiration_ttl
                    signed_request_mode                   = cdn_policy.value.signed_request_mode
                    dynamic "signed_token_options" {
                      for_each = cdn_policy.value.signed_token_options != null ? [cdn_policy.value.signed_token_options] : []
                      content {
                        allowed_signature_algorithms = signed_token_options.value.allowed_signature_algorithms
                        token_query_parameter        = signed_token_options.value.token_query_parameter
                      }
                    }
                  }
                }
                compression_mode = route_action.value.compression_mode
                dynamic "cors_policy" {
                  for_each = route_action.value.cors_policy != null ? [route_action.value.cors_policy] : []
                  content {
                    allow_credentials = cors_policy.value.allow_credentials
                    allow_headers     = cors_policy.value.allow_headers
                    allow_methods     = cors_policy.value.allow_methods
                    allow_origins     = cors_policy.value.allow_origins
                    disabled          = cors_policy.value.disabled
                    expose_headers    = cors_policy.value.expose_headers
                    max_age           = cors_policy.value.max_age
                  }
                }
                dynamic "url_rewrite" {
                  for_each = route_action.value.url_rewrite != null ? [route_action.value.url_rewrite] : []
                  content {
                    host_rewrite          = url_rewrite.value.host_rewrite
                    path_prefix_rewrite   = url_rewrite.value.path_prefix_rewrite
                    path_template_rewrite = url_rewrite.value.path_template_rewrite
                  }
                }
              }
            }
            dynamic "route_methods" {
              for_each = route_rule.value.route_methods != null ? [route_rule.value.route_methods] : []
              content {
                allowed_methods = route_methods.value.allowed_methods
              }
            }
            dynamic "url_redirect" {
              for_each = route_rule.value.url_redirect != null ? [route_rule.value.url_redirect] : []
              content {
                host_redirect          = url_redirect.value.host_redirect
                https_redirect         = url_redirect.value.https_redirect
                path_redirect          = url_redirect.value.path_redirect
                prefix_redirect        = url_redirect.value.prefix_redirect
                redirect_response_code = url_redirect.value.redirect_response_code
                strip_query            = url_redirect.value.strip_query
              }
            }
          }
        }
      }
    }
  }

  dynamic "log_config" {
    for_each = each.value.log_config != null ? [each.value.log_config] : []
    content {
      enable      = log_config.value.enable
      sample_rate = log_config.value.sample_rate
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

