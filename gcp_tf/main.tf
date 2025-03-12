provider "google" {
  project = "cloudtest2-453217"
  region  = var.region
  zone = var.zone
}

# GKE Cluster
resource "google_container_cluster" "gke_cluster" {
  name     = "orbit-cluster-1"
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  # Network
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  # Workload Identity
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}

# Node pool
resource "google_container_node_pool" "gke_nodes" {
  name       = "orbit-nodes-1"
  cluster    = google_container_cluster.gke_cluster.name
  location   = var.zone
  node_count = 2
  max_pods_per_node = 100

  node_config {
    machine_type = var.machine_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }
}

# VPC network
resource "google_compute_network" "vpc" {
  name                    = "airbyte-vpc"
  auto_create_subnetworks = false
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "airbyte-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.name
}
