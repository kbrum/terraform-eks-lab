resource "kubernetes_service_account_v1" "eks_controller_sa" {
  metadata {
    name      = "aws_load_balancer_controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.eks_controller_role.arn
    }
  }
}
