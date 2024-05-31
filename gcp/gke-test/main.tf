terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.31.1"
    }
  }
}

provider "google" {
  project     = "turbonomic-sales"
  region      = "us-central1"
}


variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

# GKE cluster


resource "google_container_cluster" "primary" {
  name     = "saurabh-gke"
  location = "us-central1-c"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = "default"
  subnetwork = "default"
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "pool1"
  location   = "us-central1-c"
  cluster    = google_container_cluster.primary.name
  node_count = 3

  node_config {
    oauth_scopes    = [
         "https://www.googleapis.com/auth/devstorage.read_only",
         "https://www.googleapis.com/auth/logging.write",
         "https://www.googleapis.com/auth/monitoring",
         "https://www.googleapis.com/auth/service.management.readonly",
         "https://www.googleapis.com/auth/servicecontrol",
         "https://www.googleapis.com/auth/trace.append",
    ]

    labels = {
      owner = "saurabh"
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "saurabh"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

