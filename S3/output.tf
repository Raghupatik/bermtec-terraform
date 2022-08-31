output "bucketid" {
  value = aws_s3_bucket.blah.id
  description = "output value of bucket name after execution"
}


output "bucket_domain_name" {
  value = aws_s3_bucket.blah.bucket_domain_name
  description = "output value of bucket name after execution"
}