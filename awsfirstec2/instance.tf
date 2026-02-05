# createing ssh key resource

resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"  # Name for the key pair in AWS
  public_key = file("${path.module}/id_rsa.pub")  # Path to the public key file
}

output "keyname" {
  value = "${aws_key_pair.key-tf.key_name}"
}

resource "aws_instance" "web" {
  ami           = "ami-085f9c64a9b75eed5"
  instance_type = "t2.micro"
# key_name      = "${aws_key_pair.key-tf.key_name}"
key_name      = aws_key_pair.key-tf.key_name
  tags = {
    Name = "first instance"
  }
}