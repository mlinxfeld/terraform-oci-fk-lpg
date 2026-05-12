variable "compartment_ocid_1" {
  description = "Compartment OCID for the first VCN and first LPG."
  type        = string
}

variable "compartment_ocid_2" {
  description = "Optional compartment OCID for the second VCN and second LPG. Defaults to compartment_ocid_1."
  type        = string
  default     = null
}

variable "vcn_1_id" {
  description = "OCID of the first VCN."
  type        = string
}

variable "vcn_1_name" {
  description = "Display name of the first VCN, used for default LPG naming."
  type        = string
}

variable "vcn_2_id" {
  description = "OCID of the second VCN."
  type        = string
}

variable "vcn_2_name" {
  description = "Display name of the second VCN, used for default LPG naming."
  type        = string
}

variable "lpg_1_display_name" {
  description = "Optional custom display name for the first LPG."
  type        = string
  default     = null
}

variable "lpg_2_display_name" {
  description = "Optional custom display name for the second LPG."
  type        = string
  default     = null
}

variable "peer_gateways" {
  description = "Whether to establish peering by setting the first LPG peer_id to the second LPG."
  type        = bool
  default     = true
}

variable "defined_tags" {
  description = "Defined tags applied to both LPGs."
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags applied to both LPGs."
  type        = map(string)
  default     = {}
}
