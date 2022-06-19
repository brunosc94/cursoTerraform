output "bucket_name"{
    value = aws_s3_bucket.this.bucket
}
output "instance_name"{
    value = aws_instance.my-ec2-instance.id
}