terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

terraform {
  cloud {
    hostname = "backend.api.env0.com"
    organization = "0b490cb7-f548-42b9-9ea0-acf8bfbf2375.75423f3c-5323-4aac-af95-416c5065cb4a"

    workspaces {
      name = "turbo-action-execution"
    }
  }
}


provider "google" {
  project     = "turbonomic-sales"
  region      = "us-central1"
  zone        = "us-central1-c"
}
