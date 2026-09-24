ARG PYTHON_VERSION=3.11

FROM python:${PYTHON_VERSION}-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:${PYTHON_VERSION}-slim
WORKDIR /app
ENV PYTHONUNBUFFERED=1
COPY --from=builder /install /usr/local
COPY . .
RUN python manage.py migrate

EXPOSE 8080
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8080"]
