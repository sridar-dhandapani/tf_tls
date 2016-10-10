output "private_key" {
  value = "${tls_private_key.kube-admin.private_key_pem}"
}

output "cert_pem" {
  value = "${tls_locally_signed_cert.kube-admin.cert_pem}"
}
