#
variable "aws_account_id" {
    type    = string
    default = "1234567890" #cambiar por la que corresponda
}
#
variable "region" {
    description = "AWS region"
    type        = string
    default     = "us-east-1"
}
#
variable "vpc_cidr" {
    type = string
    default = "172.16.0.0/16"
}
#
variable "namespace" {
    type = string
    default = "dev"
}
#
variable "project" {
    type    = string
    default = "test"
}
#
locals {
    cluster_name = "${var.project}-eks-${var.namespace}"
}
#
# eks
variable "create_eks_addons" {
    type        = bool
    description = "Enable EKS managed addons creation."
    default     = true
}
#
variable "addon_kube_proxy_version" {
    type        = string
    description = "Kube proxy managed EKS addon version."
    default     = "v1.22.6-eksbuild.1"
}

variable "addon_core_dns_version" {
    type        = string
    description = "Core DNS managed EKS addon version."
    default     = "v1.8.7-eksbuild.1"
}

variable "addon_vpc_cni_version" {
    type        = string
    description = "VPC-CNI managed EKS addon version."
    default     = "v1.11.4-eksbuild.1"
}
