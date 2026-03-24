module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source        = "./modules/eks"
  project_name  = var.project_name
  tags          = local.tags
  subnet_pub_1a = module.eks_network.subnet_pub_1a
  subnet_pub_1b = module.eks_network.subnet_pub_1b
}

module "eks_nodes" {
  source         = "./modules/nodes"
  project_name   = var.project_name
  tags           = local.tags
  cluster_name   = module.eks_cluster.cluster_name
  subnet_priv_1a = module.eks_network.subnet_priv_1a
  subnet_priv_1b = module.eks_network.subnet_priv_1b
}

module "eks_load_balancer" {
  source       = "./modules/load-balancer"
  project_name = var.project_name
  tags         = local.tags
  oidc         = module.eks_cluster.oidc
}
