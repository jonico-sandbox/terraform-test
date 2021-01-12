terraform {
  required_version = ">= 0.12, < 0.15"
}

provider "aws" {
  region = "us-east-2"

}

terraform {
  backend "s3" {

      bucket = "terraform-up-and-running-state-jonico"
      key = "workspace-example/terraform.tfstate"
      region = "us-east-2"
      dynamodb_table = "terraform-up-and-running-locks-jonico"
      encrypt = true

  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"

  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"

}
