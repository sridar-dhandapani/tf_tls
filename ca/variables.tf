variable "organization" {
  default = "apollo"
}

# valid for 1000 days
variable "validity_period_hours" {
  default = 24000
}

variable "early_renewal_hours" {
  default = 720
}

variable "is_ca_certificate" {
  default = true
}

variable "ca_count" {}

# supports if you have a public/private ip and you want to set the private ip
# for internal cert but use the public_ip to connect via ssh
variable "deploy_ssh_hosts" {}

variable "common_name" {
  default = "kube-ca"
}

variable "target_folder" {
  default = "/etc/kubernetes/ssl"
}

variable "user" {
  default = "core"
}

variable "ssh_user" {
  default = "core"
}

variable "ssh_private_key" {}
