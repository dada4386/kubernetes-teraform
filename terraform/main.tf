variable "project" {
    default = "teraform-244604"
}

module "cluster" {
    source   = "./cluster"
}

module "k8s" {
    source   = "./k8s"
    host     = "${module.cluster.host}"

    client_certificate     = "${module.cluster.client_certificate}"
    client_key             = "${module.cluster.client_key}"
    cluster_ca_certificate = "${module.cluster.cluster_ca_certificate}"
}
