resource "kubernetes_service" "endpoints" {
  metadata {
    name = "endpoints-service"
  }

  spec {
    selector = {
      app  = "endpoints-app"
    }
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8081
    }
    type = "LoadBalancer"
  }
}

