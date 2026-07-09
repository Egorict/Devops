variable "username" {
  description = "Reg.ru username"
  type        = string
}

variable "password" {
  description = "Reg.ru API password"
  type        = string
  sensitive   = true
}
variable "token" {
  description = "Reg.ru token"
  type        = string
}

variable "api_url" {
  description = "Reg.ru API api_url"
  type        = string
}