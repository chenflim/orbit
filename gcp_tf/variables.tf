variable "project_id" {
  default = "cloudtest2-453217"
  type = string
  description = "GCP Project ID"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-b"
}

variable "machine_type" {
  type = string
  default = "e2-medium" # 2 vCPU, 4GB RAM
  sensitive   = false
}
