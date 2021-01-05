compartment_id = "ocid1.compartment.oc1..aaaaaaaa46z275k7expyuz5tspezgs6w7lcukbfdbuh3ae6loasg5kjg5wka"
vcn_cidr = "10.25.16.0/21"
vcn_dns_label = "dmz1"
vcn_display_name = "dmz1"

ig_display_name = "dmz_internet_gateway"
service_gateway_display_name = "dmz_service_gateway"



/*****----- APP CIDR blocks -----*****/
subnet_app_cidr_block = "10.25.16.0/23"
subnet_app_cidr_block_1 = "10.25.16.0/25"
subnet_app_cidr_block_2 = "10.25.16.128/25"
subnet_app_cidr_block_3 = "10.25.17.0/25"
#reserved_subnet_app_cidr_block_4 = "10.25.17.128/25"

display_name_app_cidr_block_1 = "dmz_app_ad_1"
display_name_app_cidr_block_2 = "dmz_app_ad_2"
display_name_app_cidr_block_3 = "dmz_app_ad_3"
dns_label_app_cidr_block_1 = "app1"
dns_label_app_cidr_block_2 = "app2"
dns_label_app_cidr_block_3 = "app3"

/*****----- Reserved Tier CIDR blocks -----*****/
#reserved_subnet_tier_cidr_block_1a = "10.25.18.0/25"
#reserved_subnet_tier_cidr_block_2a = "10.25.18.128/25"
#reserved_subnet_tier_cidr_block_3a = "10.25.19.0/25"
#reserved_subnet_tier_cidr_block_4a = "10.25.19.128/25"

/*****----- Reserved Tier CIDR blocks -----*****/
#reserved_subnet_tier_cidr_block_1a = "10.25.20.0/25"
#reserved_subnet_tier_cidr_block_2a = "10.25.20.128/25"
#reserved_subnet_tier_cidr_block_3a = "10.25.21.0/25"
#reserved_subnet_tier_cidr_block_4a = "10.25.21.128/25"

/*****----- Reserved Tier CIDR blocks -----*****/
#reserved_subnet_tier_cidr_block_1b = "10.25.22.0/25"
#reserved_subnet_tier_cidr_block_2b = "10.25.22.128/25"
#reserved_subnet_tier_cidr_block_3b = "10.25.23.0/25"
#reserved_subnet_tier_cidr_block_4b = "10.25.23.128/25"



/*****----- Routes -----*****/
route_table_display_name = "Main Route Table"
default_vcn_0_0_0_0 = "0.0.0.0/0"




/*****----- Static Routes  -----*****/
#Required by OCI template, but will not use
list_static_routes=["10.255.255.255/32","10.255.255.254/32"]



/*****----- APP Ingress and Egress Rules -----*****/
security_list_display_name_app = "seclist_dmz_app"

//APP Example TCP Ingress Rules
security_list_rules_app_ingress_tcp =[
    {
    //Allow 443 ingress
     minport     = 443
     maxport     = 443
     source_cidr = "0.0.0.0/0"
     protocol    = 6
     stateless = "false"
    }]

//APP Example UDP Ingress Rules
security_list_rules_app_ingress_udp =[
    {
     //Example Rule - Remove when rules are in use
     minport     = 514
     maxport     = 514
     source_cidr = "10.99.96.0/22"
     protocol    = 17
     stateless = "true"
    }]
//APP Example TCP Egress Rule
security_list_rules_app_egress_tcp =[
    {
    //Allow 443 Egress
       minport     = 443
       maxport     = 443
       destination_cidr = "0.0.0.0/0"
       protocol    = 6
       stateless   = "false"
    }]
//APP Example UDP Egress Rule
security_list_rules_app_egress_udp =[
    {
       //Example Rule - Remove when rules are in use
       minport     = 514
       maxport     = 514
       destination_cidr = "10.181.1.204/32"
       protocol    = 17
       stateless   = "true"
    }]
