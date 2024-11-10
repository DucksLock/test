#
#  See https://www.terraform.io/intro/getting-started/variables.html for more details.
#

#  Change these defaults to fit your needs!

variable "esxi_hostname" {
  default = "192.168.1.10"
}

variable "esxi_hostport" {
  default = "22"
}

variable "esxi_hostssl" {
  default = "443"
}

variable "esxi_username" {
  default = "root"
}

variable "esxi_password" {
  default = "Welkom02!"
}

variable "virtual_network" {
  default = "VM Network"
}

variable "disk_store" {
  default = "DS1"
}

variable "ovf_file" {
  default = "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.ova" 
}

variable "public_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPUz0NBr8Jk3VjHKUoZFbOpyIsecfdO1bGNu/jb7/LF/ joey"
}

variable "ssh_username" {
  default = "joey"
}
