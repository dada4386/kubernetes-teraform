resource "kubernetes_replication_controller" "hello-api" {
  metadata {
    name = "hello-api"
    labels = {
      app  = "endpoints-app"
    }
  }

  spec {
    replicas = 1
    selector = {
      app = "endpoints-app"
    }

    template {
      container {
        name = "esp"
        image = "gcr.io/endpoints-release/endpoints-runtime:1"
        args = [
          "--http_port=8081",
          "--backend=0.0.0.0:3000",
          "--service=hello-api.endpoints.teraform-244604.cloud.goog",
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
          period_seconds = 3
        }
        readiness_probe {
          http_get {
            path = "/healthcheck"
            port = "8081"
          }
          initial_delay_seconds = 3
          period_seconds = 3
        }
      }
      container {
        name = "hello-api"
        image = "asia.gcr.io/teraform-244604/get-hello:latest"
        port {
          container_port = 3000
        }
      }
    }
  }
}
