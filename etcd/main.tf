resource "tls_private_key" "etcd" {
  algorithm = "RSA"
}

resource "tls_cert_request" "etcd" {
  key_algorithm   = "RSA"
  private_key_pem = "${tls_private_key.etcd.private_key_pem}"

  subject {
    common_name  = "*"
    organization = "etcd"
  }
}

resource "tls_locally_signed_cert" "etcd" {
  cert_request_pem      = "${tls_cert_request.etcd.cert_request_pem}"
  ca_key_algorithm      = "RSA"
  ca_private_key_pem    = "${var.ca_private_key_pem}"
  ca_cert_pem           = "${var.ca_cert_pem}"
  validity_period_hours = "${var.validity_period_hours}"
  early_renewal_hours   = "${var.early_renewal_hours}"

  allowed_uses = [
    "key_encipherment",
    "server_auth",
    "client_auth",
  ]
}
