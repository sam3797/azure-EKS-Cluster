resource "kubernetes_service" "my-service" {
  metadata {
    name      = "my-service"
  }
  spec {
    selector = {
      "app.kubernetes.io/name" = "nginx"
    }

    port {
      port        = 80
      target_port = 4000
    }
    type = "NodePort"
  }
}