resource "aws_cloudwatch_log_group" "lambda" {
  count = var.cloudwatch_logs && ! var.lambda_at_edge ? 1 : 0
  name = "/aws/lambda/${var.function_name}"
  retention_in_days = var.cloudwatch_logs_retention
}

resource "aws_cloudwatch_log_group" "lambda-edge" {
  count = var.cloudwatch_logs && var.lambda_at_edge ? 1 : 0
  name = "/aws/lambda/us-east-1.${var.function_name}"
  retention_in_days = var.cloudwatch_logs_retention
}
