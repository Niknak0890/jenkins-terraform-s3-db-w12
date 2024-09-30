terraform {
  backend "s3" {
    bucket         = "w10bucket-na"
    region         = "us-east-1"
    key            = "jenkins-terraform-s3-db-w12/backend.tfstate" #file to be locked and stored into s3
    dynamodb_table = "db_lock_jenk"
    encrypt        = true
  }
}