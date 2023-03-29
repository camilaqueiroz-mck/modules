output "eks_sec_group_id" {
    value = aws_eks_cluster.eks_cluster.vpc_config[0].security_group_ids
}
