<!-- BEGIN_TF_DOCS -->
# AWS VPC Simple Public Subnets

This Terraform module creates an AWS VPC with only Public Subnets.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.public_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public_route_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.allow_all_egress_from_public_to_internet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_https_ingress_from_internet_to_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_rdp_ingress_from_management_to_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_ssh_ingress_from_management_to_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.availability_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [http_http.checkip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_generated_ipv6_cidr_block"></a> [assign\_generated\_ipv6\_cidr\_block](#input\_assign\_generated\_ipv6\_cidr\_block) | Assign generated IPV6 CIDR Block in VPC. | `bool` | `false` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Availability Zones to create Public Subnets in. | `list` | <pre>[<br>  "ap-southeast-1a"<br>]</pre> | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR of the VPC. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Enable DNS Hostnames in VPC. | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Enable DNS Support in VPC. | `bool` | `true` | no |
| <a name="input_management_cidr_ranges"></a> [management\_cidr\_ranges](#input\_management\_cidr\_ranges) | Management CIDR Ranges to allow SSH and RDP access into the Public Security Group. | `list(string)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of VPC. Resources will be tagged with this Name. | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Name of Owner. Resources will be tagged with this Owner. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of Project. Resources will be tagged with this Project. | `string` | n/a | yes |
| <a name="input_public_subnet_cidr_blocks"></a> [public\_subnet\_cidr\_blocks](#input\_public\_subnet\_cidr\_blocks) | Custom CIDR Blocks to assign to each Public Subnet. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internet_gateway"></a> [internet\_gateway](#output\_internet\_gateway) | The VPC Internet Gateway. |
| <a name="output_public_security_group"></a> [public\_security\_group](#output\_public\_security\_group) | The VPC Public Security Group. |
| <a name="output_public_security_group_id"></a> [public\_security\_group\_id](#output\_public\_security\_group\_id) | The VPC Public Security Group ID. |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | The VPC Public Subnets |
| <a name="output_subnet_ids_public"></a> [subnet\_ids\_public](#output\_subnet\_ids\_public) | The VPC Public Subnets IDs. This is an map of Availability Zones to Subnet IDs. |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | The VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The VPC ID |
<!-- END_TF_DOCS -->