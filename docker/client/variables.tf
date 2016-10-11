variable "ca_cert_pem" {}

variable "ca_private_key_pem" {}

variable "ip_addresses_list" {}

# supports if you have a public/private ip and you want to set the private ip
# for internal cert but use the public_ip to connect via ssh
variable "deploy_ssh_hosts" {}

variable "dns_names_list" {
  default = "*.*.cluster.internal,*.ec2.internal"
}

variable "docker_client_count" {}

variable "private_key" {}

variable "validity_period_hours" {}

variable "early_renewal_hours" {}

variable "user" {}
