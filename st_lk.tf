resource "aws_dynamodb_table" "db_lock" {
  name         = "db_lock_jenk"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST" # Use on-demand capacity mode

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "TF Lock Table Jenkins"
  }
}

#USE terraform apply -target=aws_dynamodb_table.db_lock to create the table prior to 
##running terraform init, etc.