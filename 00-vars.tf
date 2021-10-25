variable "base_image_name" {
  type    = string
  default = "base-image1.0"
}

variable "wordpress_image_name" {
  type    = string
  default = "wordpress-image1.0"
}

variable "database_image_name" {
  type    = string
  default = "database-image_1.0"
}
variable "availability_zone" {
  type    = string
  default = "Education"
}
variable "image_id" {
  type    = string
  default = "ca4bec1a-ac25-434f-b14c-ad8078ccf39f"
}
variable "flavor_id" {
  type    = string
  default = "c1-r05-d5"
}
variable "router_name" {
  type    = string
  default = "packer_router"
}

variable "network_name" {
  type    = string
  default = "packer_network"
}
variable "subnet_name" {
  type    = string
  default = "packer_subnet"
}

variable "external_network_id" {
  type    = string
  default = "fd401e50-9484-4883-9672-a2814089528c"
}
