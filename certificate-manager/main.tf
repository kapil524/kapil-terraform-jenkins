variable "domain_name" {
  description = "The domain name for which ACM certificate will be created (e.g. cicd.kcloud-jenkins.store)"
  type        = string
}

variable "hosted_zone_id" {
  description = "Route53 Hosted Zone ID (parent zone, e.g. zone for kcloud-jenkins.store)"
  type        = string
}

# Request the certificate
resource "aws_acm_certificate" "dev_proj_1_acm_arn" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = {
    Environment = "production"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Create the DNS validation records returned by ACM
resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.dev_proj_1_acm_arn.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = var.hosted_zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
}

# Wait for ACM validation to complete (recommended)
resource "aws_acm_certificate_validation" "dev_proj_1_validation" {
  certificate_arn         = aws_acm_certificate.dev_proj_1_acm_arn.arn
  validation_record_fqdns = [for r in aws_route53_record.validation : r.fqdn]
  # depends_on not required as reference ensures ordering, but explicit for clarity:
  depends_on = [aws_route53_record.validation]
}

output "dev_proj_1_acm_arn" {
  value = aws_acm_certificate.dev_proj_1_acm_arn.arn
}
