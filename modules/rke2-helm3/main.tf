resource "helm_release" "helm3_app" {
  name             = var.helm3_app_name
  repository       = var.helm3_repo_url
  chart            = var.helm3_chart_name
  version          = var.helm3_chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace

  values = [var.helm3_chart_values]
}
