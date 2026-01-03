output "route53_hosted_zone_id" {
  description = "The ID of the newly created AWS Route53 Hosted Zone."
  value       = aws_route53_zone.delegated_zone.zone_id
}

output "route53_nameservers" {
  description = "The list of AWS nameservers that were used for delegation in the parent Route53 zone."
  value       = aws_route53_zone.delegated_zone.name_servers
}

output "account_delegating_id" {
  description = "Account ID of the AWS account delegating the Route53 zone"
  value       = data.aws_caller_identity.delegating.account_id
}

output "account_delegated_id" {
  description = "Account ID of the AWS account being delegated the Route53 zone"
  value       = data.aws_caller_identity.delegated.account_id
}
