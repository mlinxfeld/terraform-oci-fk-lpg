locals {
  lpg_1_display_name = coalesce(var.lpg_1_display_name, "${var.vcn_1_name}-to-${var.vcn_2_name}-lpg")
  lpg_2_display_name = coalesce(var.lpg_2_display_name, "${var.vcn_2_name}-to-${var.vcn_1_name}-lpg")
}

resource "oci_core_local_peering_gateway" "this_2" {
  compartment_id = coalesce(var.compartment_ocid_2, var.compartment_ocid_1)
  vcn_id         = var.vcn_2_id
  display_name   = local.lpg_2_display_name

  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags
}

resource "oci_core_local_peering_gateway" "this_1" {
  compartment_id = var.compartment_ocid_1
  vcn_id         = var.vcn_1_id
  display_name   = local.lpg_1_display_name
  peer_id        = var.peer_gateways ? oci_core_local_peering_gateway.this_2.id : null

  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags
}
