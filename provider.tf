terraform {
  backend "remote" {
    organization = "rm-lab"

    workspaces {
      name = "PIW-IST-UC-02"
    }
  }
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.43.0"
    }
  }
}

provider "openstack" {
  user_name   = var.user_name
  tenant_name = var.tenant_name
  password    = var.password
  auth_url    = var.auth_url    
}
