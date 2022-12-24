#
resource "helm_release" "metrics_server" {
    name = "metrics-server"
    repository       = "https://charts.bitnami.com/bitnami"
    chart            = "metrics-server"
    namespace        = "kube-system"
    version          = "5.11.1"
    create_namespace = false
    timeout             = 600
    reuse_values        = false
    dependency_update   = true
    force_update        = true
    recreate_pods       = true
    wait                = true
    max_history         = 10
    set {
        name  = "apiService.create"
        value = "true"
    }
    depends_on = [
        module.vpc,
        module.eks
    ]
}
#
