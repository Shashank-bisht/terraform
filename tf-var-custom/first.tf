variable age {
  type = number
  default = 0
}

variable username {
  type = string
  default = "value"
}

output "printname" {
  value = "hello , ${var.username}, your age is ${var.age}"
}