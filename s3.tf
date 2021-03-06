# S3 Bukcet
resource "aws_s3_bucket" "prdxteam2" {
  bucket = "prdxteam2"
  acl    = "public-read-write"
  policy = file("s3policy.json")
}
resource "aws_s3_bucket_object" "image" {
  bucket = "prdxteam2"
  key    = "ninja.png"
  source = "ninja.png"
  depends_on = [
    aws_s3_bucket.prdxteam2
  ]
}
resource "aws_s3_bucket_object" "video" {
  bucket = "prdxteam2"
  key    = "module-free.gif"
  source = "module-free.gif"
  depends_on = [
    aws_s3_bucket.prdxteam2
  ]
}
resource "aws_s3_bucket_object" "index" {
  bucket = "prdxteam2"
  key    = "index.html"
  source = "index.html"
  depends_on = [
    aws_s3_bucket.prdxteam2
  ]
}
resource "aws_s3_bucket_object" "default_images" {
  bucket = "prdxteam2"
  key    = "index-images.html"
  source = "index-images.html"
  depends_on = [
    aws_s3_bucket.prdxteam2
  ]
}
resource "aws_s3_bucket_object" "default_gif" {
  bucket = "prdxteam2"
  key    = "index-gif.html"
  source = "index-gif.html"
  depends_on = [
    aws_s3_bucket.prdxteam2
  ]
}
resource "aws_s3_bucket_public_access_block" "prdxteam2" {
  bucket = aws_s3_bucket.prdxteam2.id

  block_public_acls   = false
  block_public_policy = false
}
