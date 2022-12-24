#
data "kubectl_path_documents" "docs_hello" {
    pattern = "./manifests/hello/*.yaml"
}
#
resource "kubectl_manifest" "docs_hello" {
    for_each  = toset(data.kubectl_path_documents.docs_hello.documents)
    yaml_body = each.value
    depends_on = [
        module.vpc,
        module.eks,
    ]
}
#
data "kubectl_path_documents" "docs_user" {
    pattern = "./manifests/user/*.yaml"
}
#
resource "kubectl_manifest" "docs_user" {
    for_each  = toset(data.kubectl_path_documents.docs_user.documents)
    yaml_body = each.value
    depends_on = [
        module.vpc,
        module.eks,
    ]
}
#
data "kubectl_path_documents" "docs_ingress" {
    pattern = "./manifests/ingress/*.yaml"
}
#
resource "kubectl_manifest" "docs_ingress" {
    for_each  = toset(data.kubectl_path_documents.docs_ingress.documents)
    yaml_body = each.value
    depends_on = [
        module.vpc,
        module.eks,
    ]
}