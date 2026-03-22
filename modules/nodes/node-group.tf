resource "aws_eks_node_group" "eks_mng_node" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-mng-node"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  subnet_ids = [
    var.subnet_priv_1a,
    var.subnet_priv_1b,
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_attachment_worker,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_cni,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_ecr,
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-mng-node"
    }
  )
}
