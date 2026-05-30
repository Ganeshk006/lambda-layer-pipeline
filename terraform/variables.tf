variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "lambda-layer-pipeline"
}

variable "s3_bucket_name" {
  default = "lambda-layer-artifacts-ganii"  # change yourname to something unique
}

variable "layer_name" {
  default = "my-sample-layer"
}

variable "github_owner" {
  description = "Ganeshk006"
}

variable "github_repo" {
  description = "lambda-layer-pipeline"
}

variable "github_branch" {
  default = "main"
}

variable "codestar_connection_arn" {
  description = "ARN of the GitHub CodeStar connection"
}