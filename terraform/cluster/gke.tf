resource "google_container_cluster" "primary" {
    name     = "primary-${var.cluster_name}"
    location = "${var.location}"

    remove_default_node_pool    = true
    initial_node_count          = 1

    network = "${var.network}"

    addons_config {
        network_policy_config {
            disabled = true
        }
    }

    master_auth {
        username = ""
        password = ""
    }

    min_master_version  = "${var.min_master_version}"
    node_version        = "${var.node_version}"

}

resource "google_container_node_pool" "primary_nodes" {
    name        = "primary-${var.cluster_name}-nodes"
    location    = "${var.location}"
    cluster     = "${google_container_cluster.primary.name}"
    node_count  = "${var.primary_node_count}"

    management {
        auto_repair = true
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

        machine_type = "${var.machine_type}" 

        metadata {
            disable-legacy-endpoints = "true"
        }
    }
}

output "client_certificate" {
    value     = "${google_container_cluster.primary.master_auth.0.client_certificate}"
    sensitive = true
}

output "client_key" {
    value     = "${google_container_cluster.primary.master_auth.0.client_key}"
    sensitive = true
}

output "cluster_ca_certificate" {
    value     = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
    sensitive = true
}

output "host" {
    value     = "${google_container_cluster.primary.endpoint}"
    sensitive = true
}

