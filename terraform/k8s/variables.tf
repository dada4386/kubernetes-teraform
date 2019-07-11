variable "container_tag" {}
variable "location" {}

variable "cluster_name" {
  default = "microservice-test"
}

variable "network" {
  default = "default"
}

variable "primary_node_count" {
  default = "4"
}

variable "machine_type" {
  default = "f1-micro"
}

variable "min_master_version" {
  default = "1.13.6-gke.13"
}

variable "node_version" {
  default = "1.13.6-gke.13"
}
