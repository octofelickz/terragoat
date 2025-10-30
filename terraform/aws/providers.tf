
provider "aws" {
  profile = var.profile
  region  = var.region
}

provider "aws" {
  alias   = "plain_text_access_keys_provider"
  region  = "us-west-1"
  # Security Fix: Removed hardcoded credentials. 
  # Use environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY instead,
  # or configure credentials via AWS CLI/SDK credential files.
  # Original vulnerable code contained hardcoded AWS access_key and secret_key values
}

terraform {
  backend "s3" {
    encrypt = true
  }
}
