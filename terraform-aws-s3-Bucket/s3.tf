resource "aws_s3_bucket" "s3_bucket" {
  bucket = "nagesh-tf-test-bucket-2222"
  tags = {
    Name        = "nagesh-terraform-bucket-1234"
    Environment = "Dev"
  }
}
