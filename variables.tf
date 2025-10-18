variable "bucket_name" {
  type        = string
  description = "Remote state bucket name"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "vpc_name" {
  type        = string
  description = "DevOps Project 1 VPC Name"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "eu_availability_zone" {
  type        = list(string)
  description = "Availability Zones"
}

variable "public_key" {
  type        = string
  description = "Public key for EC2 instance"
}

variable "ec2_ami_id" {
  type        = string
  description = "AMI Id for EC2 instance"
}

# -------------------------------
# New variables for Jenkins / ALB
# -------------------------------

variable "domain_name" {
  type        = string
  description = "Domain name for Route53 hosted zone and ACM certificate"
  default     = "cicd.kcloud-jenkins.store"
}

variable "terraform_version" {
  type        = string
  default     = "1.6.5"
  description = "Terraform version to install in Jenkins EC2 userdata"
}
