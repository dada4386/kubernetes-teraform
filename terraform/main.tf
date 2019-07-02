module "cluster" {
  source   = "./cluster"
  project  = "${var.project}"
  location = "${var.location}"
}

module "sql" {
  source    = "./sql"  
  region    = "${var.region}"
  project   = "${var.project}"
}

module "k8s" {
  source   = "./k8s"
  host     = "${module.cluster.host}"

  client_certificate     = "${module.cluster.client_certificate}"
  client_key             = "${module.cluster.client_key}"
  cluster_ca_certificate = "${module.cluster.cluster_ca_certificate}"
  container_tag = "${var.container_tag}"
}

module "endpoints" {
  source   = "./endpoint"

  project      = "${var.project}"
  openapi_path = "${var.openapi_path}"
}
