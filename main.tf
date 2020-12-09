
#!---------------------------------
#Create Virtual Cloud Network (VCN)
resource "oci_core_virtual_network" "environment_vcn" {
  compartment_id = var.compartment_id
  cidr_block     = var.vcn_cidr
  dns_label      = var.vcn_dns_label
  display_name   = var.vcn_display_name
}




#!---------------------------------
#Create Internet Gateway
resource "oci_core_internet_gateway" "net_ig" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_virtual_network.environment_vcn.id
    display_name = var.ig_display_name
}




#!---------------------------------
#Get the OCID for all all IAD services in the region
data "oci_core_services" "get_svcs_id" {
}



#!---------------------------------
#Create Service Gateway
resource "oci_core_service_gateway" "net_service_gateway" {
    compartment_id = var.compartment_id
    services {
        service_id = data.oci_core_services.get_svcs_id.services.1.id
    }
    vcn_id = oci_core_virtual_network.environment_vcn.id

    display_name = var.service_gateway_display_name
}



#!---------------------------------
# Testing output of data
#output "show-ads" {
#  value = "${data.oci_identity_availability_domains.ads.availability_domains.0}"
#}

#output "instance_ip_addr" {
#  value = data.oci_core_ipsec_connection_tunnels.ip_sec_connection_tunnels_ash.ip_sec_connection_tunnels.0
#}
#output "instance_ip_addr1" {
#  value = data.oci_core_ipsec_connection_tunnels.ip_sec_connection_tunnels_ash.ip_sec_connection_tunnels.1
#}
