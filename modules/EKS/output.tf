output "eks_oidc_cert" {
  value = data.tls_certificate.eks_oidc_tls_cert
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}

output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}
