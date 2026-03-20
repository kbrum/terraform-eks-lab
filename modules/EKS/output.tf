output "eks_oidc_cert" {
  value = data.tls_certificate.eks_oidc_tls_cert
}
