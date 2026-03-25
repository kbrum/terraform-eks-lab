variable "project_name" {
  type        = string
  description = "Project name to be used for all resources"
}

variable "tags" {
  type        = map(any)
  description = "Project tags"
}

variable "oidc" {
  type        = string
  description = "OIDC url to use in role"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}
