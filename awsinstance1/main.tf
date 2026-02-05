

resource "aws_instance" "instance"{
    count = 2
    ami ="ami-085f9c64a9b75eed5"
    instance_type = "t2.micro"

    tags = {
      Name = "demoinstance-${count.index}"
    }
}