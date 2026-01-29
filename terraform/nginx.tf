resource "kubernetes_deployment" "nginx" {
  wait_for_rollout = false

  metadata {
    name = "nginx"
    labels = { app = "nginx" }
  }

  spec {
    replicas = 1

    selector {
      match_labels = { app = "nginx" }
    }

    template {
      metadata {
        labels = { app = "nginx" }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
