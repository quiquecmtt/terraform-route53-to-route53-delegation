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

resource "aws_route53_hosted_zone_dnssec" "delegated_zone_dnssec" {
  count          = var.enable_dnssec ? 1 : 0
  hosted_zone_id = aws_route53_zone.delegated_zone.zone_id
}

resource "aws_route53_key_signing_key" "delegated_zone_dnssec" {
  count                      = var.enable_dnssec ? 1 : 0
  name                       = "delegated-zone-${replace(var.route53_delegated_zone, ".", "-")}"
  hosted_zone_id             = aws_route53_zone.delegated_zone.zone_id
  key_management_service_arn = var.dnssec_kms_key_arn
}

resource "aws_route53_query_log" "delegated_zone_query_log" {
  count                    = var.enable_query_logging ? 1 : 0
  zone_id                  = aws_route53_zone.delegated_zone.zone_id
  cloudwatch_log_group_arn = var.query_logging_cloudwatch_log_group_arn
}
