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

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## License

MIT
