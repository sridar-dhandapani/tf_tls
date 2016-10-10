# docker_daemon certs
resource "tls_private_key" "docker_daemon" {
  algorithm = "RSA"
}

resource "tls_cert_request" "docker_daemon" {
  count           = "${var.docker_daemon_count}"
  key_algorithm   = "RSA"
  private_key_pem = "${tls_private_key.docker_daemon.private_key_pem}"

  subject {
    common_name = "docker_daemon"
  }

  dns_names = ["${split(",", var.dns_names_list)}"]

  ip_addresses = [
    "127.0.0.1",
    "${element(var.ip_addresses_list, count.index)}",
  ]
}

resource "tls_locally_signed_cert" "docker_daemon" {
  count              = "${var.docker_daemon_count}"
  cert_request_pem   = "${element(tls_cert_request.docker_daemon.*.cert_request_pem, count.index)}"
  ca_key_algorithm   = "RSA"
  ca_private_key_pem = "${var.ca_private_key_pem}"
  ca_cert_pem        = "${var.ca_cert_pem}"

  validity_period_hours = "${var.validity_period_hours}"
  early_renewal_hours   = "${var.early_renewal_hours}"

  allowed_uses = [
    "server_auth",
    "client_auth",
    "digital_signature",
    "key_encipherment",
  ]
}
