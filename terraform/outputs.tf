output "s3_bucket_name" {
  value = aws_s3_bucket.layer_bucket.bucket
}

output "codebuild_project_name" {
  value = aws_codebuild_project.lambda_layer_build.name
}

output "codepipeline_name" {
  value = aws_codepipeline.lambda_layer_pipeline.name
}

output "pipeline_artifact_bucket" {
  value = aws_s3_bucket.pipeline_artifacts.bucket
}