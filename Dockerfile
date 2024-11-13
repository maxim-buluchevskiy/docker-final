# Базовый образ Go
FROM golang:1.22.0

# Создаем и переходим в рабочую директорию
WORKDIR /app

# Копируем все нужные файлы в контейнер
COPY go.mod go.sum *.go tracker.db ./

# Загружаем зависимости
RUN go mod download

# Соберем приложение
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /docker-final

# Запускаем приложение
CMD ["/docker-final"]
