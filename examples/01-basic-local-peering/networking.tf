module "vcn1" {
  source = "git::https://github.com/mlinxfeld/terraform-oci-fk-vcn.git"

  compartment_ocid = var.compartment_ocid
  name             = "fk-vcn-1"
  vcn_cidr_blocks  = ["10.10.0.0/16"]

  extra_network_entity_ids = {
    lpg_to_vcn2 = module.lpg.lpg_1_id
  }

  route_tables = {
    app_to_vcn2 = {
      display_name = "fk-vcn-1-app-rt"
      route_rules = [
        {
          destination        = "10.20.0.0/16"
          destination_type   = "CIDR_BLOCK"
          network_entity_key = "lpg_to_vcn2"
        }
      ]
    }
  }

  security_lists = {
    workload = {
      ingress_rules = [
        {
          description = "Allow SSH from VCN2"
          protocol    = "6"
          source      = "10.20.0.0/16"
          tcp_options = {
            min = 22
            max = 22
          }
        },
        {
          description = "Allow ICMP from VCN2"
          protocol    = "1"
          source      = "10.20.0.0/16"
          icmp_options = {
            type = 3
            code = 4
          }
        },
        {
          description = "Allow VCN-internal traffic"
          protocol    = "all"
          source      = "10.10.0.0/16"
        }
      ]
      egress_rules = [
        {
          description = "Allow all outbound"
          protocol    = "all"
          destination = "0.0.0.0/0"
        }
      ]
    }
  }

  subnets = {
    app = {
      display_name                  = "fk-vcn-1-app"
      cidr_block                    = "10.10.1.0/24"
      route_table_key               = "app_to_vcn2"
      include_default_security_list = false
      security_list_keys            = ["workload"]
      prohibit_internet_ingress     = true
      prohibit_public_ip_on_vnic    = true
    }
  }
}

module "vcn2" {
  source = "git::https://github.com/mlinxfeld/terraform-oci-fk-vcn.git"

  compartment_ocid = var.compartment_ocid
  name             = "fk-vcn-2"
  vcn_cidr_blocks  = ["10.20.0.0/16"]

  extra_network_entity_ids = {
    lpg_to_vcn1 = module.lpg.lpg_2_id
  }

  route_tables = {
    app_to_vcn1 = {
      display_name = "fk-vcn-2-app-rt"
      route_rules = [
        {
          destination        = "10.10.0.0/16"
          destination_type   = "CIDR_BLOCK"
          network_entity_key = "lpg_to_vcn1"
        }
      ]
    }
  }

  security_lists = {
    workload = {
      ingress_rules = [
        {
          description = "Allow SSH from VCN1"
          protocol    = "6"
          source      = "10.10.0.0/16"
          tcp_options = {
            min = 22
            max = 22
          }
        },
        {
          description = "Allow ICMP from VCN1"
          protocol    = "1"
          source      = "10.10.0.0/16"
          icmp_options = {
            type = 3
            code = 4
          }
        },
        {
          description = "Allow VCN-internal traffic"
          protocol    = "all"
          source      = "10.20.0.0/16"
        }
      ]
      egress_rules = [
        {
          description = "Allow all outbound"
          protocol    = "all"
          destination = "0.0.0.0/0"
        }
      ]
    }
  }

  subnets = {
    app = {
      display_name                  = "fk-vcn-2-app"
      cidr_block                    = "10.20.1.0/24"
      route_table_key               = "app_to_vcn1"
      include_default_security_list = false
      security_list_keys            = ["workload"]
      prohibit_internet_ingress     = true
      prohibit_public_ip_on_vnic    = true
    }
  }
}

module "lpg" {
  source = "../.."

  compartment_ocid_1 = var.compartment_ocid
  vcn_1_id           = module.vcn1.vcn_id
  vcn_1_name         = module.vcn1.vcn_name

  vcn_2_id   = module.vcn2.vcn_id
  vcn_2_name = module.vcn2.vcn_name
}
