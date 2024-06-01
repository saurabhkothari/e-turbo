resource "env0_gcp_gke_credentials" "credentials" {
  name           = var.gke_cred_name
  cluster_name   = var.gke_cluster_name
  compute_region = "us-central1"
}

data "env0_project" "project" {
  name = "Turbo PoV"
}

resource "env0_cloud_credentials_project_assignment" "assignment" {
  credential_id = env0_gcp_gke_credentials.credentials.id
  project_id    = data.env0_project.project.id
}