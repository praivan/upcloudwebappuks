terraform {
  required_version = ">= 1.0.0"
  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = "~> 5.0"
    }
  }
}
