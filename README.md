# terraform-oci-fk-lpg

This repository contains a reusable **Terraform/OpenTofu module** and progressive examples for deploying **Oracle Cloud Infrastructure (OCI) Local Peering Gateways (LPGs)** between two VCNs in the same region.

It is part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and serves as a focused building block for OCI networking courses, multicloud comparisons, and advanced connectivity scenarios.

---

## 🎯 Purpose

The goal of this module is to provide a **clean, composable, and educational reference implementation** for OCI local VCN peering:

- Focused on **LPG creation and peering only**
- No hidden route table or subnet mutations outside the caller's control
- Designed to be composed with **terraform-oci-fk-vcn** and future OCI connectivity modules

This is **not** a full network foundation module. It is a **small connectivity primitive** intended for learning, reuse, and composition.

---

## ✨ What the module does

The module creates:

- One Local Peering Gateway in `VCN1`
- One Local Peering Gateway in `VCN2`
- Optional LPG peering relationship between both gateways

The module intentionally does **not** create:
- VCNs
- Subnets
- Route Tables
- Security Lists
- DRGs
- Remote Peering Connections

Each of those concerns belongs in its own dedicated module or composition layer.

---

## 📂 Repository Structure

```bash
terraform-oci-fk-lpg/
├── examples/
│   ├── 01-basic-local-peering/
│   └── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

All examples are runnable and demonstrate how LPG-based local peering composes with reusable VCN foundations.

---

## 🚀 Example Usage

```hcl
module "lpg" {
  source = "git::https://github.com/mlinxfeld/terraform-oci-fk-lpg.git?ref=v0.1.0"

  compartment_ocid_1 = var.compartment_ocid
  vcn_1_id           = module.vcn1.vcn_id
  vcn_1_name         = module.vcn1.vcn_name

  vcn_2_id   = module.vcn2.vcn_id
  vcn_2_name = module.vcn2.vcn_name
}
```

In a complete deployment, each VCN should also define route rules for the remote CIDR and attach those route tables to the relevant subnets. In this ecosystem, that routing is typically modeled inside **terraform-oci-fk-vcn** via `route_tables`, `route_table_key`, and `extra_network_entity_ids`.

---

## ⚙️ Module Inputs

| Variable | Type | Required | Description |
|--------|------|----------|-------------|
| `compartment_ocid_1` | `string` | ✅ | Compartment OCID for the first LPG |
| `compartment_ocid_2` | `string` | ❌ | Compartment OCID for the second LPG; defaults to `compartment_ocid_1` |
| `vcn_1_id` | `string` | ✅ | First VCN OCID |
| `vcn_1_name` | `string` | ✅ | First VCN display name |
| `vcn_2_id` | `string` | ✅ | Second VCN OCID |
| `vcn_2_name` | `string` | ✅ | Second VCN display name |
| `lpg_1_display_name` | `string` | ❌ | Optional custom display name for the first LPG |
| `lpg_2_display_name` | `string` | ❌ | Optional custom display name for the second LPG |
| `peer_gateways` | `bool` | ❌ | Whether to establish LPG peering automatically |
| `defined_tags` | `map(string)` | ❌ | Defined tags applied to both LPGs |
| `freeform_tags` | `map(string)` | ❌ | Freeform tags applied to both LPGs |

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `lpg_1_id` | First LPG OCID |
| `lpg_2_id` | Second LPG OCID |
| `lpg_ids` | Map of LPG labels to OCIDs |
| `lpg_1_name` | First LPG display name |
| `lpg_2_name` | Second LPG display name |
| `vcn_ids` | Map of connected VCN IDs |

---

## 🧩 Examples Overview

| Example | Description |
|-------|-------------|
| `01-basic-local-peering` | Two reusable OCI VCNs connected through LPGs, with routing defined inside `terraform-oci-fk-vcn` |

See [`examples/`](examples) for details.

---

## 🧠 Design Philosophy

- Explicit over implicit
- Small modules over monoliths
- Connectivity modules separate from network foundation modules
- Optimized for **learning, reuse, and composition**

This makes the module useful for:
- OCI networking training
- Same-region VCN peering labs
- Multicloud architecture comparisons
- Progressive evolution toward DRG-based patterns

---

## 📌 Notes

- LPG peering is **same-region only**
- LPG peering is **non-transitive**
- Route rules and security rules must still be configured on both sides
- For broader routing patterns and long-term OCI platform direction, DRG-based connectivity should be treated as the strategic path

---

## 🌐 Learn More

Visit [FoggyKitchen.com](https://foggykitchen.com/) for OCI, multicloud, and Terraform/OpenTofu learning resources.

---

## 🪪 License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.  
See [LICENSE](LICENSE) for more details.
