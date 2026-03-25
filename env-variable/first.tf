
variable username {
  type = string
  default = "tatti"
}

output "printname" {
  value = "hello , ${var.username}"
}