terraform {
  required_version = ">= 1.0"
  required_providers {
    regru = {
      source  = "sport24ru/regru"
      version = "~> 1.0" # Используйте последнюю стабильную версию
    }
  }
}

provider "regru" {
  username = var.username
  password = var.password
}

# Создаём A-запись для домена example.com, указывающую на ваш IP
resource "regru_dns_a_record" "my_site" {
  zone    = "apollonovaalisaviachislavovna.ru" # Ваш домен
  name    = "www"                              # Поддомен (будет www.example.com). "@" для основного домена
  records = ["194.226.163.161"]                # Ваш публичный IP-адрес
}

resource "regru_dns_a_record" "main_domain" {
  zone    = "apollonovaalisaviachislavovna.ru"
  name    = "@" # означает сам домен (без поддомена)
  records = ["194.226.163.161"]
}