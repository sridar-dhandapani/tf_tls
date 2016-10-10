output "private_key" {
  value = "${tls_private_key.kubelet.private_key_pem}"
}

output "cert_pems" {
  value = "${join(",", tls_locally_signed_cert.kubelet.*.cert_pem)}"
}
