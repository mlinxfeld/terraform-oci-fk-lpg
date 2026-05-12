output "lpg_1_id" {
  description = "OCID of the first LPG."
  value       = oci_core_local_peering_gateway.this_1.id
}

output "lpg_2_id" {
  description = "OCID of the second LPG."
  value       = oci_core_local_peering_gateway.this_2.id
}

output "lpg_ids" {
  description = "Map of LPG labels to OCIDs."
  value = {
    lpg_1 = oci_core_local_peering_gateway.this_1.id
    lpg_2 = oci_core_local_peering_gateway.this_2.id
  }
}

output "lpg_1_name" {
  description = "Display name of the first LPG."
  value       = oci_core_local_peering_gateway.this_1.display_name
}

output "lpg_2_name" {
  description = "Display name of the second LPG."
  value       = oci_core_local_peering_gateway.this_2.display_name
}

output "vcn_ids" {
  description = "Map of connected VCN IDs."
  value = {
    vcn_1 = var.vcn_1_id
    vcn_2 = var.vcn_2_id
  }
}
