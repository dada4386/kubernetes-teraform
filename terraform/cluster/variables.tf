variable "project" {
    default = "teraform-244604"
}

variable "cluster_name" {
    default = "microservice-test"
}

variable "location" {
    default = "asia-northeast1-a"
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