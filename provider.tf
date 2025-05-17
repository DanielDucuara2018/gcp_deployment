terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.35.0"
    }
  }
}

provider "google" {
  credentials = file("${path.module}/resources/${var.credential_file}")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}