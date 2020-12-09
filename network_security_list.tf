resource "oci_core_security_list" "app_security_list" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_virtual_network.environment_vcn.id
  display_name = var.security_list_display_name_app

    //APP local subnet ingress
    ingress_security_rules {
      source = var.subnet_app_cidr_block
      protocol    = "all"
    }

    //APP icmp ingress
    ingress_security_rules {
      source    = "0.0.0.0/0"
      protocol  = "1"
      stateless = "true"
      icmp_options {
        type = 8
      }
    }
    ingress_security_rules {
      source    = "0.0.0.0/0"
      protocol  = "1"
      stateless = "true"
      icmp_options {
        type = 0
      }
    }
    //Uncomment for APP tcp ingress rules
    /*----------------------------------------------------------------
    dynamic "ingress_security_rules" {
       iterator = each_rule
       for_each = [for y in var.security_list_rules_app_ingress_tcp : {
         minport     = y.minport
         maxport     = y.maxport
         source_cidr = y.source_cidr
         protocol    = y.protocol
         stateless   = y.stateless
         }]
         content {
           protocol  = each_rule.value.protocol
           source    = each_rule.value.source_cidr
           //stateless = each_rule.value.stateless
           tcp_options {
             // These values correspond to the destination port range.
             min = each_rule.value.minport
             max = each_rule.value.maxport
           }
         }
    }*/

    //Uncomment for APP udp ingress rules
    /*----------------------------------------------------------------
    dynamic "ingress_security_rules" {
       iterator = each_rule
       for_each = [for y in var.security_list_rules_app_ingress_udp : {
         minport     = y.minport
         maxport     = y.maxport
         source_cidr = y.source_cidr
         protocol    = y.protocol
         stateless   = y.stateless
         }]
         content {
           protocol  = each_rule.value.protocol
           source    = each_rule.value.source_cidr
           //stateless = each_rule.value.stateless
           udp_options {
             // These values correspond to the destination port range.
             min = each_rule.value.minport
             max = each_rule.value.maxport
           }
         }
    }*/

    //APP local subnet egress
    egress_security_rules {
      destination = var.subnet_app_cidr_block
      protocol    = "all"
    }

    //APP service gateway egress
    egress_security_rules {
      destination = data.oci_core_services.get_svcs_id.services.1.cidr_block
      protocol    = "6"
      destination_type = "SERVICE_CIDR_BLOCK"
      stateless   = "false"
    }

    //APP icmp egress
    egress_security_rules {
      destination = "0.0.0.0/0"
      protocol    = "1"
      stateless   = "true"
      icmp_options {
        type = 8
      }
    }

    //Allow All traffic outbound
    /*----------------------------------------------------------------
    egress_security_rules {
      destination = "0.0.0.0/0"
      protocol    = "1"
      stateless   = "true"
      icmp_options {
        type = 0
      }
    }*/

    //Uncomment for APP tcp ingress rules
    /*----------------------------------------------------------------
    dynamic "egress_security_rules" {
       iterator = each_rule
       for_each = [for y in var.security_list_rules_app_egress_tcp : {
         minport     = y.minport
         maxport     = y.maxport
         destination_cidr = y.destination_cidr
         protocol    = y.protocol
         stateless   = y.stateless
         }]
         content {
           protocol  = each_rule.value.protocol
           destination    = each_rule.value.destination_cidr
           stateless = each_rule.value.stateless
           tcp_options {
             // These values correspond to the destination port range.
             min = each_rule.value.minport
             max = each_rule.value.maxport
           }
         }
    }*/

    //Uncomment for APP udp egress rules
    /*----------------------------------------------------------------
    dynamic "egress_security_rules" {
       iterator = each_rule
       for_each = [for y in var.security_list_rules_app_egress_udp : {
         minport     = y.minport
         maxport     = y.maxport
         destination_cidr = y.destination_cidr
         protocol    = y.protocol
         stateless   = y.stateless
         }]
         content {
           protocol  = each_rule.value.protocol
           destination    = each_rule.value.destination_cidr
           stateless = each_rule.value.stateless
           udp_options {
             // These values correspond to the destination port range.
             min = each_rule.value.minport
             max = each_rule.value.maxport
           }
         }
    }*/
}
