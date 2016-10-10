variable "ca_cert_pem" {}

variable "ca_private_key_pem" {}

variable "ip_addresses" {}

# supports if you have a public/private ip and you want to set the private ip
# for internal cert but use the public_ip to connect via ssh
variable "deploy_ssh_hosts" {}

variable "kubelet_count" {
  default = "1"
}

variable "validity_period_hours" {
  default = "8760"
}

variable "early_renewal_hours" {
  default = "720"
}

variable "ssh_user" {
  default = "core"
}

variable "ssh_private_key" {}
