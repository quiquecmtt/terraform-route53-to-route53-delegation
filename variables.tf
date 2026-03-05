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

variable "enable_dnssec" {
  description = "Enable DNSSEC signing for the delegated zone"
  type        = bool
  default     = false
}

variable "dnssec_kms_key_arn" {
  description = "KMS key ARN for DNSSEC signing. Required if enable_dnssec is true"
  type        = string
  default     = null
  sensitive   = false
}

variable "enable_query_logging" {
  description = "Enable DNS query logging for the delegated zone"
  type        = bool
  default     = false
}

variable "query_logging_cloudwatch_log_group_arn" {
  description = "CloudWatch log group ARN for DNS query logging. Required if enable_query_logging is true"
  type        = string
  default     = null
  sensitive   = false
}
