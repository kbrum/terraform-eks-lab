variable "project_name" {
  type        = string
  description = "Project name to be used for all resources"
}

variable "tags" {
  type        = map(any)
  description = "Project tags"
}

variable "subnet_pub_1a" {
  type        = string
  description = "Public subnet 1a ID"
}

variable "subnet_pub_1b" {
  type        = string
  description = "Public subnet 1b ID"
}
