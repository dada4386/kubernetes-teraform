resource "kubernetes_ingress" "endpoints_ingress" {
  metadata {
    name = "endpoints-ingress"
    annotations = {
      "kubernetes.io/ingress.global-static-ip-name" = "endpointip"
    }
    labels = {
      apps = "endpoints-ingress"
    }
  }
  spec {
    backend {
      service_name = "endpoints-service"
      service_port = 8081
    }
  }
}
