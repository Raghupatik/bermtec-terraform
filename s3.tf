resource "aws_s3_bucket" "blah" {
  bucket = var.bucketname

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ProjectId = "1234567"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.blah.id
  acl    = "private"
}