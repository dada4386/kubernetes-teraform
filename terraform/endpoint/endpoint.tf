variable "openapi_path" {}

resource "google_endpoints_service" "openapi_service" {
  service_name   = "hello-api.endpoints.teraform-244604.cloud.goog"
  project        = "teraform-244604"
  openapi_config = "${file(var.openapi_path)}"
}
