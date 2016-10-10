# Kubernetes master certs
resource "tls_private_key" "master" {
  algorithm = "RSA"
}

resource "tls_cert_request" "master" {
  count           = "${var.master_count}"
  key_algorithm   = "RSA"
  private_key_pem = "${tls_private_key.master.private_key_pem}"

  subject {
    common_name = "kube-master"
  }

  dns_names    = ["${compact(var.dns_names)}", "kubernetes", "kubernetes.default", "kubernetes.default.svc", "kubernetes.default.svc.cluster.local"]
  ip_addresses = ["${concat(var.kube_service_ip, var.ip_addresses)}"]
}

resource "tls_locally_signed_cert" "master" {
  count                 = "${var.master_count}"
  cert_request_pem      = "${element(tls_cert_request.master.*.cert_request_pem, count.index)}"
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
