# Kubernetes admin-key
resource "tls_private_key" "kube-admin" {
  algorithm = "RSA"
}

resource "tls_cert_request" "kube-admin" {
  key_algorithm   = "RSA"
  private_key_pem = "${tls_private_key.kube-admin.private_key_pem}"

  subject {
    common_name = "kube-admin"
  }
}

resource "tls_locally_signed_cert" "kube-admin" {
  cert_request_pem      = "${tls_cert_request.kube-admin.cert_request_pem}"
  ca_key_algorithm      = "RSA"
  ca_private_key_pem    = "${var.ca_private_key_pem}"
  ca_cert_pem           = "${var.ca_cert_pem}"
  validity_period_hours = "${var.validity_period_hours}"
  early_renewal_hours   = "${var.early_renewal_hours}"

  allowed_uses = [
    "server_auth",
    "client_auth",
    "digital_signature",
    "key_encipherment",
  ]
}
