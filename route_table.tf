#!---------------------------------
#Create Route Table for VCN
resource "oci_core_route_table" "main_route_table" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_virtual_network.environment_vcn.id

    display_name = var.route_table_display_name
    route_rules {
        network_entity_id = oci_core_internet_gateway.net_ig.id
        destination      = var.default_vcn_0_0_0_0
        destination_type = "CIDR_BLOCK"
    }
    /*
    Service gateway rules need to be specific
    route_rules {
        network_entity_id = oci_core_service_gateway.net_service_gateway.id
        destination       = data.oci_core_services.get_svcs_id.services.1.cidr_block
        destination_type  = "SERVICE_CIDR_BLOCK"
    }*/

}



#!---------------------------------
#Attach route table to az-subnets
resource "oci_core_route_table_attachment" "route_table_attachment_app_1" {
  subnet_id = oci_core_subnet.app_ad_1.id
  route_table_id =oci_core_route_table.main_route_table.id
}

resource "oci_core_route_table_attachment" "route_table_attachment_app_2" {
  subnet_id = oci_core_subnet.app_ad_2.id
  route_table_id =oci_core_route_table.main_route_table.id
}

resource "oci_core_route_table_attachment" "route_table_attachment_app_3" {
  subnet_id = oci_core_subnet.app_ad_3.id
  route_table_id =oci_core_route_table.main_route_table.id
}
