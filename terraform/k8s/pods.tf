resource "kubernetes_replication_controller" "api-master" {
  metadata {
    name = "api-master"
    labels = {
      app  = "api-app"
    }
  }

  spec {
    replicas = 1
    selector = {
      app = "api-app"
    }

    template {
      container {
        name = "endpoints-master"
        image = "gcr.io/endpoints-release/endpoints-runtime:1"
        args = [
          "-p=8081",
          "-a=0.0.0.0:3000",
          "-s=api-master.endpoints.teraform-244604.cloud.goog",
          "-R=managed"
        ]
        port {
          container_port = 8081
        }
      }
      container {
        name = "api-master"
        image = "asia.gcr.io/teraform-244604/get-hello:latest"
        port {
          container_port = 3000
        }
      }
    }
  }
}
