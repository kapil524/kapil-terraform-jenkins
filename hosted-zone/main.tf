variable "domain_name" {
  description = "Full domain name to create record for (e.g. cicd.kcloud-jenkins.store)"
  type        = string
}

variable "hosted_zone_name" {
  description = "Parent hosted zone name (e.g. kcloud-jenkins.store)"
  type        = string
  default     = "kcloud-jenkins.store"
}

variable "aws_lb_dns_name" {
  type = string
}

variable "aws_lb_zone_id" {
  type = string
}

# Lookup the hosted zone by name (the parent zone)
data "aws_route53_zone" "parent" {
  name         = var.hosted_zone_name
  private_zone = false
}

# derive the subdomain label (e.g. cicd from cicd.kcloud-jenkins.store)
locals {
  subdomain_label = replace(var.domain_name, ".${var.hosted_zone_name}", "")
}

resource "aws_route53_record" "lb_record" {
  zone_id = data.aws_route53_zone.parent.zone_id
  # If domain_name equals hosted_zone_name then subdomain_label becomes same as domain root; use "" for root
  name    = local.subdomain_label != "" ? local.subdomain_label : data.aws_route53_zone.parent.name
  type    = "A"

  alias {
    name                   = var.aws_lb_dns_name
    zone_id                = var.aws_lb_zone_id
    evaluate_target_health = true
  }
}

output "hosted_zone_id" {
  value = data.aws_route53_zone.parent.zone_id
}
