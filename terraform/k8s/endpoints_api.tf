resource "kubernetes_service" "endpoints" {
  metadata {
    name = "endpoints-service"
    labels = {
      apps = "endpoints-service"
    }
  }

  spec {
    selector = {
      app = "endpoints-app"
    }
    port {
      protocol    = "TCP"
      port        = 8081
      target_port = 8081
    }
    type = "NodePort"
  }
}

resource "kubernetes_deployment" "hello-api" {
  metadata {
    name = "hello-api"
    labels = {
      app = "endpoints-app"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "endpoints-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "endpoints-app"
        }
      }

      spec {
        container {
          name  = "esp"
          image = "gcr.io/endpoints-release/endpoints-runtime:1"
          args = [
            "--http_port=8081",
            "--backend=0.0.0.0:3000",
            "--service=hello-api2.endpoints.teraform-244604.cloud.goog",
            "--rollout_strategy=managed"
          ]
          port {
            container_port = 8081
          }
          liveness_probe {
            http_get {
              path = "/healthcheck"
              port = "8081"
            }
            initial_delay_seconds = 3
            period_seconds        = 3
          }
          readiness_probe {
            http_get {
              path = "/healthcheck"
              port = "8081"
            }
            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
        container {
          name  = "hello-api"
          image = "asia.gcr.io/teraform-244604/get-hello:latest"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}
