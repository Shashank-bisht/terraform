
variable username {
  type = string
}

output "printname" {
  value = "hello , ${var.username}"
}