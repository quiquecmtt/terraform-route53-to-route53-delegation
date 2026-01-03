data "aws_caller_identity" "delegated" {
  provider = aws.delegated
}

resource "aws_route53_zone" "delegated_zone" {
  name    = var.route53_delegated_zone
  comment = "Delegated zone from account ${data.aws_caller_identity.delegating.account_id}. Managed by OpenTofu"
  tags = {
    managedBy  = "OpenTofu"
    tofuModule = "route53-to-route53-delegation"
  }
}
