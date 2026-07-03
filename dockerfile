# Берем готовый образ с веб-сервером Nginx
FROM nginx:alpine

# Копируем ваш HTML-файл в папку, которую Nginx показывает по умолчанию
COPY index.html /usr/share/nginx/html/index.html

# Говорим, что контейнер будет слушать 80 порт
EXPOSE 80