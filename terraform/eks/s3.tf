resource "aws_s3_bucket" "my-bucket" {
  bucket = "statefiles-terraform-github-1234"
}

resource "aws_s3_bucket_acl" "my-bucket-acl" {
  bucket = aws_s3_bucket.my-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "my-bucket_versioning" {
  bucket = aws_s3_bucket.my-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}