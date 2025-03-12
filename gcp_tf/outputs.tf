output "kubernetes_cluster_name" {
  value       = google_container_cluster.gke_cluster.name
  sensitive   = false
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.gke_cluster.endpoint
  description = "GKE Cluster Host"
  sensitive   = false
}
