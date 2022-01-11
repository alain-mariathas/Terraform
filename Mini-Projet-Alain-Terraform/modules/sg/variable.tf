variable "admin" {
  type    = string
  default = "Alain"
}

variable "protocol" {
  type    = string
  default = "tcp"
}


variable "description_sg_group" {
  type    = string
  default = "Autorise le traffic http, https et ssh"
}

variable "description_ssh" {
  type    = string
  default = "Autorise le traffic ssh depuis tous les hotes"
}

variable "port_ssh" {
  type    = number
  default = 22
}

variable "description_http" {
  type    = string
  default = "Autorise le traffic http depuis tous les hotes"
}

variable "port_http" {
  type    = number
  default = 80
}

variable "description_https" {
  type    = string
  default = "Autorise le traffic https depuis tous les hotes"
}

variable "port_https" {
  type    = number
  default = 443
}

variable "description_egress" {
  type    = string
  default = "Autorise la sortie du traffic"
}

variable "port_egress" {
  type    = number
  default = 0
}

variable "protocol_egress" {
  type    = string
  default = "-1"
}

variable "cidr_blocks" {
  type    = string
  default = "0.0.0.0/0"
}

variable "ipv6_cidr_blocks" {
  type    = string
  default = "::/0"
}