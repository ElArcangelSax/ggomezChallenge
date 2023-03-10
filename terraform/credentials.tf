# se necesita para deployar helm
provider "helm" {
    kubernetes {
        host                   = module.eks.cluster_endpoint
        cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
        
        exec {  
            api_version = "client.authentication.k8s.io/v1alpha1"
            command     = "aws"
            # This requires the awscli to be installed locally where Terraform is executed
            args = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
        }
    }
}
#
# se necesita para deployar secrets
provider "kubernetes" {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    
    exec {
        api_version = "client.authentication.k8s.io/v1alpha1"
        command     = "aws"
        # This requires the awscli to be installed locally where Terraform is executed
        args = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
    }
}
# se necesita para deployar secrets
provider "kubectl" {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    
    exec {
        api_version = "client.authentication.k8s.io/v1alpha1"
        command     = "aws"
        # This requires the awscli to be installed locally where Terraform is executed
        args = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
    }
}
