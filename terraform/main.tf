provider "google" {
  project = "${var.project}"
  region  = "${var.location}"
}

module "base" {
  source = "./google"
  project = "${var.project}"
  location = "${var.location}"
}

module "sql" {
  source    = "./sql"  
  region    = "${var.region}"
  project   = "${var.project}"
}

module "k8s" {
  source   = "./k8s"
  location = "${var.location}"
  container_tag = "${var.container_tag}"
}

module "endpoints" {
  source   = "./endpoint"

  project      = "${var.project}"
  openapi_path = "${var.openapi_path}"
}
