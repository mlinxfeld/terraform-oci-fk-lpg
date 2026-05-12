output "vcn_1_id" {
  description = "VCN1 OCID."
  value       = module.vcn1.vcn_id
}

output "vcn_2_id" {
  description = "VCN2 OCID."
  value       = module.vcn2.vcn_id
}

output "lpg_1_id" {
  description = "VCN1 LPG OCID."
  value       = module.lpg.lpg_1_id
}

output "lpg_2_id" {
  description = "VCN2 LPG OCID."
  value       = module.lpg.lpg_2_id
}

output "subnet_ids" {
  description = "Subnet IDs created by the example."
  value = {
    vcn1_app = module.vcn1.subnet_ids["app"]
    vcn2_app = module.vcn2.subnet_ids["app"]
  }
}
