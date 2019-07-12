variable "container_tag" {}
variable "location" {}

variable "cluster_name" {
  default = "microservice-test"
}

variable "network" {
  default = "default"
}

variable "k8s_pool" {
  default = {
    initial_node_count = 4
    min_node_count     = 2
    max_node_count     = 10
    cluster_node_type  = "g1-small"
  }
}

variable "min_master_version" {
  default = "1.13.6-gke.13"
}

variable "node_version" {
  default = "1.13.6-gke.13"
}
