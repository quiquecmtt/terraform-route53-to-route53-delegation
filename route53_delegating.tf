data "aws_caller_identity" "delegating" {
  provider = aws.delegating
}

data "aws_route53_zone" "delegating_zone" {
  provider = aws.delegating
  name     = var.route53_delegating_zone
}

resource "aws_route53_record" "delegation_ns_records" {
  provider = aws.delegating
  zone_id  = data.aws_route53_zone.delegating_zone.zone_id
  name     = var.route53_delegated_zone
  type     = "NS"
  ttl      = 300
  records  = aws_route53_zone.delegated_zone.name_servers
}

