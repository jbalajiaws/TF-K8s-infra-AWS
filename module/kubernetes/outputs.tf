output "cluster_id" {
  value       = aws_eks_cluster.this.id
  description = "The ID of the EKS cluster"
}

output "node_group_id" {
  value       = aws_eks_node_group.eks_nodes.id
  description = "The ID of the EKS node group"
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "The endpoint of the EKS cluster"
}

output "cluster_arn" {
  value       = aws_eks_cluster.this.arn
  description = "The ARN of the EKS cluster"
}
