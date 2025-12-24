# Simplified package url
FROM registry.cn-shanghai.aliyuncs.com/memtensor/memos:base-v1.0

# Full package url
# FROM registry.cn-shanghai.aliyuncs.com/memtensor/memos-full-base:v1.0.0

WORKDIR /app

ENV HF_ENDPOINT=https://hf-mirror.com

ENV PYTHONPATH=/app/src

COPY src/ ./src/

EXPOSE 8000

CMD ["uvicorn", "memos.api.server_api:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]