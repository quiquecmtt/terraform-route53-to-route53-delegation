# terraform-route53-to-route53-delegation

Terraform/OpenTofu module for Route53 to Route53 delegation between AWS accounts. Enables delegating DNS subdomains from one AWS account's Route53 zone to another AWS account's Route53 zone.

## Usage

```hcl
module "route53_delegation" {
  source = "github.com/quiquecmtt/terraform-route53-to-route53-delegation"

  providers = {
    aws.delegating = aws.parent_account
    aws.delegated  = aws.child_account
  }

  route53_delegating_zone = "example.com"
  route53_delegated_zone  = "subdomain.example.com"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.25.0 |
| <a name="provider_aws.delegated"></a> [aws.delegated](#provider\_aws.delegated) | 6.25.0 |
| <a name="provider_aws.delegating"></a> [aws.delegating](#provider\_aws.delegating) | 6.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.delegation_ns_records](https://registry.terraform.io/providers/hashicorp/aws/6.25.0/docs/resources/route53_record) | resource |
| [aws_route53_zone.delegated_zone](https://registry.terraform.io/providers/hashicorp/aws/6.25.0/docs/resources/route53_zone) | resource |
| [aws_caller_identity.delegated](https://registry.terraform.io/providers/hashicorp/aws/6.25.0/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.delegating](https://registry.terraform.io/providers/hashicorp/aws/6.25.0/docs/data-sources/caller_identity) | data source |
| [aws_route53_zone.delegating_zone](https://registry.terraform.io/providers/hashicorp/aws/6.25.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_route53_delegated_zone"></a> [route53\_delegated\_zone](#input\_route53\_delegated\_zone) | Route53 (sub)domain to delegate to Route53 | `string` | n/a | yes |
| <a name="input_route53_delegating_zone"></a> [route53\_delegating\_zone](#input\_route53\_delegating\_zone) | Route53 zone used for delegation | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_delegated_id"></a> [account\_delegated\_id](#output\_account\_delegated\_id) | Account ID of the AWS account being delegated the Route53 zone |
| <a name="output_account_delegating_id"></a> [account\_delegating\_id](#output\_account\_delegating\_id) | Account ID of the AWS account delegating the Route53 zone |
| <a name="output_route53_hosted_zone_id"></a> [route53\_hosted\_zone\_id](#output\_route53\_hosted\_zone\_id) | The ID of the newly created AWS Route53 Hosted Zone. |
| <a name="output_route53_nameservers"></a> [route53\_nameservers](#output\_route53\_nameservers) | The list of AWS nameservers that were used for delegation in the parent Route53 zone. |
<!-- END_TF_DOCS -->

## License

MIT
