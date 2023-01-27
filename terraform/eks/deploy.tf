resource "kubernetes_deployment" "deploymentnginx-1" {
  metadata {
    name = "deploymentnginx-1"
    labels = {
      App = "nginx1"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "nginx1"
      }
    }
    template {
      metadata {
        labels = {
          App = "nginx1"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "nginx-container1"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
