resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks_cluster"
  role_arn   = aws_iam_role.aws_role_eks.arn

  vpc_config {
    subnet_ids = var.private_subnets_id
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.exercise-AmazonEKSClusterPolicy,
    # aws_iam_role_policy_attachment.exercise-AmazonEKSVPCResourceController
  ]
}
