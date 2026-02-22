variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "cidr" {
  description = "VPC CIDR Block"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Public Subnet CIDR"
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "Availability Zone"
  default     = "us-east-1a"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  default     = "ami-xxxxxxxx"
}

variable "key_name" {
  description = "SSH key name"
  default     = "terraform-key"
}

variable "public_key_path" {
  description = "Path to public SSH key"
}

variable "private_key_path" {
  description = "Path to private SSH key"
}