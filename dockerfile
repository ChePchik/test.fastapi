# Используем официальный образ Python 3.10
FROM python:3.10-slim


# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app


# Копируем файлы с зависимостями в контейнер
COPY requirements.txt .


# Устанавливаем необходимые зависимости
RUN pip install --no-cache-dir -r requirements.txt


# Копируем всё содержимое текущей директории в контейнер
COPY . .


# Открываем порт для доступа к FastAPI
EXPOSE 8000


# Команда для запуска FastAPI с использованием uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
