# Bucket for storing layer ZIPs
resource "aws_s3_bucket" "layer_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "layer_bucket_versioning" {
  bucket = aws_s3_bucket.layer_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Separate bucket for CodePipeline artifacts
resource "aws_s3_bucket" "pipeline_artifacts" {
  bucket        = "${var.s3_bucket_name}-pipeline-artifacts"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "pipeline_artifacts_versioning" {
  bucket = aws_s3_bucket.pipeline_artifacts.id
  versioning_configuration {
    status = "Enabled"
  }
}