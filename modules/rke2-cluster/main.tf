# Create a new rancher v2 RKE2 custom Cluster v2
resource "rancher2_cluster_v2" "rke2_cluster" {
  name = "${var.cluster_name}"

  kubernetes_version = var.kubernetes_version
  enable_network_policy = var.enable_network_policy
  default_cluster_role_for_project_members = "user"
  labels = var.rke2_cluster_labels
  rke_config {
    etcd {
        disable_snapshots = false
        snapshot_retention = 5
        snapshot_schedule_cron = "0 */5 * * *"
    }
    dynamic "machine_pools" {
      for_each = var.machine_pools
      content {
        name                      = machine_pools.value.name
        machine_labels            = machine_pools.value.machine_labels
        cloud_credential_secret_name = machine_pools.value.cloud_credential_secret_name
        control_plane_role        = machine_pools.value.control_plane_role
        etcd_role                 = machine_pools.value.etcd_role
        worker_role               = machine_pools.value.worker_role
        quantity                  = machine_pools.value.quantity
        machine_config {
          kind = machine_pools.value.machine_config.kind
          name = machine_pools.value.machine_config.name
        }
        dynamic "taints" {
          for_each = machine_pools.value.taints
            content {
              key    = taints.value.key
              value  = taints.value.value
              effect = taints.value.effect
            }
        }
      }
    }
    machine_global_config = var.machine_global_config
    chart_values = var.chart_values
    upgrade_strategy {
        control_plane_concurrency =  "1"
        worker_concurrency =  "1"
    }
    registries {}
    dynamic "machine_selector_config" {
      for_each = var.machine_selector_config
      content {
        config = jsonencode(machine_selector_config.value.config)
      }
    }
  }
}
