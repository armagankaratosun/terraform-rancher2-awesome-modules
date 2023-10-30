variable cloud_credential_name {
   type = string
   description = "openstack cloud credential name for rancher, this is a bug from rancher. just create an empty cloud credential named test in rancher"
}
variable cluster_name {
   type = string
   description = "name of the rke cluster"
}
variable kubernetes_version {
   type = string
   default = "v1.23.15+rke2r1"
   description = "kubernetes version of the rke cluster, defaults to v1.23.15+rke2r1"
}
variable enable_network_policy {
   type = bool
   default = true
   description = "option to enable or disable Project Network Isolation."
}
variable "machine_pools" {
  type = map(object({
    name                      = string
    cloud_credential_secret_name = string
    control_plane_role        = bool
    etcd_role                 = bool
    worker_role               = bool
    quantity                  = number
    machine_config = object({
      kind = string
      name = string
    })
  }))
  description = "machine pool settings for the nodes in the rancher cluster, it is a "
}

variable machine_global_config {
   type = string
   description = "global configuration options for the rke cluster"
}

variable chart_values {
   type = string
   description = "rke provided helm charts chart values"
}

# Define the list of labels as variables
variable "rke2_cluster_labels" {
  description = "Labels for the RKE2 cluster"
  type        = map(string)
}
