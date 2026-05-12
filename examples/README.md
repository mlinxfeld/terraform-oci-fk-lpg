# OCI Local Peering Gateways with Terraform/OpenTofu - Training Examples

This directory contains runnable examples for the **terraform-oci-fk-lpg** module.
The examples focus on practical OCI Local Peering Gateway deployment patterns for same-region VCN-to-VCN connectivity.

These examples are part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and are used across OCI and multicloud courses covering networking, connectivity composition, and architecture fundamentals.

---

## Published Examples

| Example | Title | Key Topics |
|:-------:|:------|:-----------|
| 01 | **Basic Local Peering** | two VCNs, two LPGs, same-region peering, route table composition, `terraform-oci-fk-vcn` integration |

---

## How to Use

The example directory contains:
- Terraform/OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the goal of the example
- A minimal, runnable architecture

To run the basic local peering example:

```bash
cd examples/01-basic-local-peering
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
tofu apply
```

---

## Design Principles

- One example = one architectural goal
- No unused or placeholder resources
- Clear separation of concerns between network foundation and connectivity composition
- Examples designed to integrate with reusable VCN modules rather than reimplementing VCN internals

---

## Related Resources

- [FoggyKitchen OCI Local Peering Gateway Module (terraform-oci-fk-lpg)](../)
- [FoggyKitchen OCI VCN Module (terraform-oci-fk-vcn)](https://github.com/mlinxfeld/terraform-oci-fk-vcn)
- [FoggyKitchen OCI Compute Module (terraform-oci-fk-compute)](https://github.com/mlinxfeld/terraform-oci-fk-compute)
- [FoggyKitchen Azure VNet Peering Module (terraform-az-fk-vnet-peering)](https://github.com/mlinxfeld/terraform-az-fk-vnet-peering)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](../LICENSE) for details.

---

© 2026 FoggyKitchen.com - Cloud. Code. Clarity.
