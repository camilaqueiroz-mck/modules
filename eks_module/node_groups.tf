resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks_node_group"
  node_role_arn   = aws_iam_role.aws_role_node.arn
  subnet_ids      = var.subnets_private_ids
  instance_types = [ "t3.micro" ]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.exercise-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.exercise-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.exercise-AmazonEC2ContainerRegistryReadOnly,
  ]
}