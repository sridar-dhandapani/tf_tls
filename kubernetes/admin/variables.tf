variable "ca_cert_pem" {}

variable "ca_private_key_pem" {}

variable "validity_period_hours" {
  default = "8760"
}

variable "early_renewal_hours" {
  default = "720"
}

variable "kubectl" {
  default = "kubectl"
}

variable "kubectl_server_ip" {}

variable "cluster_id" {
  default = "kube"
}
