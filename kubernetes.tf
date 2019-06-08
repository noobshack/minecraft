resource "kubernetes_deployment" "minecraft" {
  metadata {
    name = local.service

    labels = {
      app = local.service
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = local.service
      }
    }

    template {
      metadata {
        labels = {
          app = local.service
        }
      }

      spec {
        host_network = true

        container {
          image = "gcr.io/${local.project}/minecraft:${local.minecraft_version}"
          name  = local.service

          resources {
            limits {
              cpu    = "2"
              memory = "12Gi"
            }

            requests {
              cpu    = "1"
              memory = "4Gi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "minecraft" {
  metadata {
    name = local.service

    labels = {
      app = local.service
    }
  }

  spec {
    selector = {
      app = kubernetes_deployment.minecraft.metadata[0].labels.app
    }

    session_affinity = "ClientIP"

    type = "LoadBalancer"

    port {
      name        = "gameserver"
      port        = 25565
      target_port = 25565
    }

  }
}

