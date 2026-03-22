variable "project_name" {
  type        = string
  description = "Project name to be used for all resources"
}

variable "tags" {
  type        = map(any)
  description = "Project tags"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}

variable "subnet_priv_1a" {
  type        = string
  description = "Private subnet 1a ID"
}

variable "subnet_priv_1b" {
  type        = string
  description = "Private subnet 1b ID"
}
