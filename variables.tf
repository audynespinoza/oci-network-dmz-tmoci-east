variable compartment_id {}
variable vcn_cidr {}
variable vcn_dns_label {}
variable vcn_display_name {}

variable ig_display_name {}
variable service_gateway_display_name {}

variable subnet_app_cidr_block {}
variable subnet_app_cidr_block_1 {}
variable subnet_app_cidr_block_2 {}
variable subnet_app_cidr_block_3 {}
variable display_name_app_cidr_block_1 {}
variable display_name_app_cidr_block_2 {}
variable display_name_app_cidr_block_3 {}
variable dns_label_app_cidr_block_1 {}
variable dns_label_app_cidr_block_2 {}
variable dns_label_app_cidr_block_3 {}


variable route_table_display_name {}
variable default_vcn_0_0_0_0 {}

variable security_list_display_name_app {}
variable security_list_rules_app_ingress_tcp {
    type = list(
      object({
       minport = number
       maxport = number
       source_cidr = string
       protocol    = number
       stateless  = string}),)
    }
variable security_list_rules_app_ingress_udp {
    type = list(
      object({
       minport = number
       maxport = number
       source_cidr = string
       protocol    = number
       stateless  = string}),)
    }
variable security_list_rules_app_egress_tcp {
    type = list(
        object({
         minport = number
         maxport = number
         destination_cidr = string
         protocol    = number
         stateless  = string}))
    }
variable security_list_rules_app_egress_udp {
    type = list(
        object({
         minport = number
         maxport = number
         destination_cidr = string
         protocol    = number
         stateless  = string}))
    }



#Required by OCI template, but will not use
variable list_static_routes {type = list(string)}
