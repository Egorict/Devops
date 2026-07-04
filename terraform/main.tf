terraform {
  required_providers {
    regru = {
      source  = "regru/regru-cloud"
      version = "1.0.2"
    }
  }
}

provider "regru" {
  username = var.username
  password = var.password
}

resource "regru_cloud_server" "my_server" {
  # параметры пока не важны, главное — сам ресурс
}