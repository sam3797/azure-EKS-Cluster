resource "kubernetes_ingress" "alb-ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "alb-ingress"
    annotations = {
      "kubernetes.io/ingress.class" = "alb"
    #   "alb.ingress.kubernetes.io/target-type" = "instance"
    }
  }
  spec {
    rule {
      http {
        path {
          path = "/*"
          backend {
            service_name = "my-service"
            service_port = 80
          }
        }
      }
    }
  }
}