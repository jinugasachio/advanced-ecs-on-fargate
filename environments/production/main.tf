// resource "aws_vpc" "main" {
//   cidr_block = "10.0.0.0/16"
// }

resource "aws_instance" "foo" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t1.2xlarge" # invalid type!
}
