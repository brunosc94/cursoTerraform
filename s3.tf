resource "aws_s3_bucket" "this" {
  bucket = "my-tf-test-bucket-00770044"

  tags = local.common_tags
}

resource "aws_s3_bucket_acl" "acl_this_bucket" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.this.bucket
  key    = "config/${local.ip_filepath}"
  source = local.ip_filepath
  etag   = filemd5(local.ip_filepath)
  content_type = "application/json"
}