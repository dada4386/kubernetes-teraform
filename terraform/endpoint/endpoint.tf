resource "google_endpoints_service" "openapi_service" {
  service_name   = "api-master.endpoints.teraform-244604.cloud.goog"
  project        = "teraform-244604"
  openapi_config = "${file("./endpoint/openapi_spec.yml")}"
}
