output "bucket_id" {
  description = "id da bucket criada na aws"
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "arn da bucket criada na aws"
  value       = aws_s3_bucket.bucket.arn
}