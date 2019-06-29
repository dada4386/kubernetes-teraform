resource "kubernetes_service" "endpoints" {
  metadata {
    name = "endpoints-service"
    labels = {
      apps = "endpoints-service"
    }
  }

  spec {
    selector = {
      app  = "endpoints-app"
    }
    port {
      protocol    = "TCP"
      port        = 8081
      target_port = 8081
    }
    type = "NodePort"
  }
}

