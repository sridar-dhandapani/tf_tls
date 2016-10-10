output "private_key" {
  value = "${tls_private_key.docker_daemon.private_key_pem}"
}

output "cert_pems" {
  value = "${join(",", tls_locally_signed_cert.docker_daemon.*.cert_pem)}"
}
