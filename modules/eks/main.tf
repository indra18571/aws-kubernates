# Define an IAM role for the EKS cluster
resource "aws_iam_role" "my_cluster_role" {
  name = "my-cluster-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "eks.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })
}

# Define an IAM policy for the EKS cluster role
resource "aws_iam_policy" "my_cluster_policy" {
  name        = "my-cluster-policy"
  description = "Policy for my EKS cluster"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "eks:DescribeCluster"
        ],
        "Resource": "*"
      }
    ]
  })
}

# Attach the policy to the IAM role
resource "aws_iam_role_policy_attachment" "my_cluster_policy_attachment" {
  policy_arn = aws_iam_policy.my_cluster_policy.arn
  role       = aws_iam_role.my_cluster_role.name
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = aws_iam_role.my_cluster_role.arn
  vpc_config {
    subnet_ids         = var.subnet-ids
    //["subnet-12345678", "subnet-23456789"] # Change to your subnet IDs
    security_group_ids = ["${var.sg-id}"]
   // security_group_ids = ["sg-12345678"] # Change to your security group ID
  }
}


