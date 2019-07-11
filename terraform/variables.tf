variable "project" {
  default = "teraform-244604"
}

variable "openapi_path" {
  default = "./endpoint/openapi_spec.yml"
}

variable "container_tag" {
  default = "latest"
}

variable "region" {
  default = "us-west1"
}

variable "location" {
  default = "us-west1-a"
}

variable "global_domain" {
  default = "data-diary.info"
}
