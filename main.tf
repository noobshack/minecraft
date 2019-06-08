terraform {
  required_version = ">= 0.12.1"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "noobshack"

    workspaces {
      name = "minecraft"
    }
  }
}

provider "kubernetes" {
  config_context_auth_info = "gke_noobshack-164103_us-east1_althea"
  config_context_cluster   = "gke_noobshack-164103_us-east1_althea"
}

provider "google" {
  project = "noobshack-164103"
  region  = "us-west2"
}

data "google_compute_network" "default" {
  name    = "default"
  project = local.project
}

data "google_compute_subnetwork" "default" {
  name    = "default"
  project = local.project
  region  = local.region
}
