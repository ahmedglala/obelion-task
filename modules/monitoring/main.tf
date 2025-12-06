resource "aws_sns_topic" "cpu_alerts" {
  name = "${var.name_prefix}-cpu-alerts"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.cpu_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# Frontend CPU > 50%
resource "aws_cloudwatch_metric_alarm" "frontend_cpu" {
  alarm_name          = "${var.name_prefix}-frontend-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Frontend CPU above 50% for 10 minutes"
  alarm_actions       = [aws_sns_topic.cpu_alerts.arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = var.frontend_instance_id
  }
}

# Backend CPU > 50%
resource "aws_cloudwatch_metric_alarm" "backend_cpu" {
  alarm_name          = "${var.name_prefix}-backend-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Backend CPU above 50% for 10 minutes"
  alarm_actions       = [aws_sns_topic.cpu_alerts.arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = var.backend_instance_id
  }
}