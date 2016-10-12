variable "ca_cert_pem" {}

variable "ca_private_key_pem" {}

variable "ip_addresses_list" {
  type = "list"
}

# supports if you have a public/private ip and you want to set the private ip
# for internal cert but use the public_ip to connect via ssh
variable "deploy_ssh_hosts" {
  type = "list"
}

variable "dns_names_list" {
  default = "kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster.local"
}

variable "docker_daemon_count" {}

variable "private_key" {}

variable "validity_period_hours" {
  default = 8760
}

variable "early_renewal_hours" {
  default = 720
}

variable "user" {
  default = "core"
}
