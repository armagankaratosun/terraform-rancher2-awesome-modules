output "rancher_cluster_id" {
  value = rancher2_cluster_v2.rke2_cluster.id
}

output "rancher_cluster_v1_id" {
  value = rancher2_cluster_v2.rke2_cluster.cluster_v1_id
}

output "cluster_name" {
  value = rancher2_cluster_v2.rke2_cluster.name
}

output "kubeconfig" {
  value = rancher2_cluster_v2.rke2_cluster.kube_config
}

