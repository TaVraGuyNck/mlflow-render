FROM python:3.9-slim

WORKDIR /app
COPY . .

RUN pip install --upgrade pip && \
    pip install mlflow

EXPOSE 8080

CMD ["mlflow", "server", \
     "--backend-store-uri", "sqlite:///mlflow.db", \
     "--default-artifact-root", "./artifacts", \
     "--host", "0.0.0.0", "--port", "8080"]
