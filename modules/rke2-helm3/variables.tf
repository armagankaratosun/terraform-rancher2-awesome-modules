## Helm3 and K8s variables
variable helm3_app_name {
   type = string
   description = "name of your helm3 app, this is not the same with the cart name."
}
variable helm3_repo_url {
   type = string
   description = "source code repo url of the cart"
}
variable helm3_chart_name {
   type = string
   description = "the name of the helm cart you wish to deploy"
}
variable helm3_chart_version { 
   type = string
   description = "the version of the helm cart you wish to deploy"
}
variable namespace {  
   type = string
   description = "target namespace in the kubernetes cluster"
}
variable helm3_chart_values { 
   type = string
   description = "the cart values that needs to be customized. can be a yaml file."
}
variable create_namespace { 
   type = bool
   description = "create the namespace if it does not exist."
}
