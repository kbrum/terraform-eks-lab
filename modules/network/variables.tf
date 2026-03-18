variable "cidr_block" {
  type        = string
  description = "Networkin cidr block to be used for the VPC"
}

variable "project_name" {
  type        = string
  description = "Project name to be used for all resources"
}

variable "tags" {
  type        = map(any)
  description = "Project tags"
}
