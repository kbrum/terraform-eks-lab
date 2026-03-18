module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source       = "./modules/EKS"
  project_name = var.project_name
  tags         = local.tags
}
