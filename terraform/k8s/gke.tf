resource "google_container_cluster" "primary" {
  name     = "primary-${var.cluster_name}"
  location = "${var.location}"

  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "${var.network}"

  addons_config {
    network_policy_config {
      disabled = true
    }
  }

  master_auth {
    username = ""
    password = ""
  }

  min_master_version = "${var.min_master_version}"
  node_version       = "${var.node_version}"

}

resource "google_container_node_pool" "primary_nodes" {
  name               = "primary-${var.cluster_name}-nodes"
  location           = "${var.location}"
  cluster            = "${google_container_cluster.primary.name}"
  initial_node_count = "${lookup(var.k8s_pool, "initial_node_count")}"

  autoscaling {
    min_node_count = "${lookup(var.k8s_pool, "min_node_count")}"
    max_node_count = "${lookup(var.k8s_pool, "max_node_count")}"
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]
    preemptible  = true
    machine_type = "${lookup(var.k8s_pool, "cluster_node_type")}"
  }
}
