resource "aws_codebuild_project" "lambda_layer_build" {
  name          = "${var.project_name}-build"
  service_role  = aws_iam_role.codebuild_role.arn
  build_timeout = 10

  source {
    type      = "CODEPIPELINE"
    buildspec = "app/buildspec.yml"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = false

    environment_variable {
      name  = "S3_BUCKET_NAME"
      value = var.s3_bucket_name
    }

    environment_variable {
      name  = "LAYER_NAME"
      value = var.layer_name
    }

    environment_variable {
      name  = "AWS_REGION"
      value = var.aws_region
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/codebuild/${var.project_name}"
      stream_name = "build-log"
    }
  }
}