variable "openapi_path" {}

variable "project" {}

resource "google_endpoints_service" "openapi_service" {
  service_name   = "hello-api.endpoints.teraform-244604.cloud.goog"
  project        = "${var.project}"
  openapi_config = "${file(var.openapi_path)}"
}
