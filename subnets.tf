#!---------------------------------
#Get Availability Domain data
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}


#!---------------------------------
#Create Application Tier Subnets
resource "oci_core_subnet" "app_ad_1" {
    cidr_block = var.subnet_app_cidr_block_1
    compartment_id = var.compartment_id
    vcn_id = oci_core_virtual_network.environment_vcn.id
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains.0.name
    display_name = var.display_name_app_cidr_block_1
    dns_label = var.dns_label_app_cidr_block_1
    security_list_ids = [oci_core_security_list.app_security_list.id,]
    #prohibit_public_ip_on_vnic = "true"
}

resource "oci_core_subnet" "app_ad_2" {
    cidr_block = var.subnet_app_cidr_block_2
    compartment_id = var.compartment_id
    vcn_id = oci_core_virtual_network.environment_vcn.id
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains.1.name
    display_name = var.display_name_app_cidr_block_2
    dns_label = var.dns_label_app_cidr_block_2
    security_list_ids = [oci_core_security_list.app_security_list.id,]
    #prohibit_public_ip_on_vnic = "true"
}

resource "oci_core_subnet" "app_ad_3" {
    cidr_block = var.subnet_app_cidr_block_3
    compartment_id = var.compartment_id
    vcn_id = oci_core_virtual_network.environment_vcn.id
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains.2.name
    display_name = var.display_name_app_cidr_block_3
    dns_label = var.dns_label_app_cidr_block_3
    security_list_ids = [oci_core_security_list.app_security_list.id,]
    #prohibit_public_ip_on_vnic = "true"
}
