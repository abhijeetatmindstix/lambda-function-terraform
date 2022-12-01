resource "aws_s3_bucket" "my-bucket-for-lambda" {
    bucket = "abhijeet-test1-s3" 
    acl = "private"   
}

resource "aws_s3_bucket_object" "object1" {
    for_each = fileset("uploads/", "*")
    bucket = aws_s3_bucket.my-bucket-for-lambda.id
    key = each.value
    source = "uploads/${each.value}"
    etag = filemd5("uploads/${each.value}")
}