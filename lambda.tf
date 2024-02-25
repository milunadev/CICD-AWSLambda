terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

variable "AWS_ACCOUNT_ID" {
  
}


resource "aws_lambda_function" "simple_lambda_function" {
  function_name = "CICD-demo"
  role = "arn:aws:iam::${var.AWS_ACCOUNT_ID}:role/AWSLambdaBasicExecutionRole"
  runtime       = "python3.9"
  filename = "indexpython.zip"
  handler = "lambda_function.lambda_handler"
  lifecycle {
    ignore_changes = [filename, source_code_hash]
  }

}
