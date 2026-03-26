variable "cidr_block" {
  type        = string
  description = "Networking cidr block to be used for the VPC"
}

variable "project_name" {
  type        = string
  description = "Project name to be used for all resources"
}

variable "region" {
  type        = string
  description = "AWS region to deploy resources"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to all resources"
}
