variable "project" {}

variable "cluster_name" {
    default = "saurabh-gke"
}

variable "nodepool_name" {
    default = "my-node-pool"
}

variable "node_count" {
    default = 4
}

variable "serviceaccount" {
    default = "default"
}

variable "machine_type" {
    default = "e2-medium"
}