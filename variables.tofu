variable "route53_delegating_zone" {
  description = "Route53 zone used for delegation"
  type        = string
  nullable    = false
  sensitive   = false
}

variable "route53_delegated_zone" {
  description = "Route53 (sub)domain to delegate to Route53"
  type        = string
  nullable    = false
  sensitive   = false
}
