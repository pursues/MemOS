
# Base image url为已打包好的镜像url
FROM registry.cn-shanghai.aliyuncs.com/memtensor/memos:base-v1.0

# Install dependencies

# Set working directory
WORKDIR /app

# Set Hugging Face mirror
ENV HF_ENDPOINT=https://hf-mirror.com

# Install Python packages
#COPY docker/requirements.txt .
#RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY src/ ./src/

# Set Python import path
ENV PYTHONPATH=/app/src


# Expose port
EXPOSE 8005



# Start the docker
CMD ["uvicorn", "memos.api.server_api:app", "--host", "0.0.0.0", "--port", "8005", "--reload"]