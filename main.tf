terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
    }
  }
}

provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

locals {
  templatevars = {
    public_key    = var.public_key
    ssh_username   = var.ssh_username
  }
}

resource "esxi_guest" "webserver" {
  count              = 2
  guest_name         = format("webserver%d", count.index + 1)
  disk_store         = var.disk_store
  numvcpus           = 1
  memsize            = 2048
  ovf_source         = var.ovf_file
  
  network_interfaces {
    virtual_network = var.virtual_network
  }

  guestinfo = {
    "metadata"          = base64encode(templatefile("metadata.yaml", {
      name = format("webserver%d", count.index + 1)
    }))
    "metadata.encoding" = "base64"
    "userdata"          = base64encode(templatefile("userdata.yaml", local.templatevars))
    "userdata.encoding" = "base64"
  }
}

resource "esxi_guest" "databaseserver" {
  guest_name         = "databaseserver"
  disk_store         = var.disk_store
  numvcpus           = 1
  memsize            = 2048
  ovf_source         = var.ovf_file
  
  network_interfaces {
    virtual_network = var.virtual_network
  }

  guestinfo = {
    "metadata"          = base64encode(templatefile("metadata.yaml", {
      name = "databaseserver"
    }))
    "metadata.encoding" = "base64"
    "userdata"          = base64encode(templatefile("userdata.yaml", local.templatevars))
    "userdata.encoding" = "base64"
  }
}
