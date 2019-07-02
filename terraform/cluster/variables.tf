variable "project" {}
variable "location" {}

variable "cluster_name" {
    default = "microservice-test"
}

variable "network" {
    default = "default"
}

variable "primary_node_count" {
    default = "2"
}

variable "machine_type" {
    default = "n1-standard-1"
}

variable "min_master_version" {
    default = "1.13.6-gke.13"
}

variable "node_version" {
    default = "1.13.6-gke.13"
}
