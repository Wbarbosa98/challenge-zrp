
output "bucket_name" {
  value = aws_s3_bucket.static.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.static.arn
}

output "bucket_domain" {
  value = aws_s3_bucket.static.bucket_regional_domain_name
}
