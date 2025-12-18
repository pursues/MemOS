# Base image
FROM python:3.11-slim

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN rm -rf /app/

WORKDIR /app


# Set Aliyun mirror
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list.d/debian.sources

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gcc \
        libc6-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install dependencies
#RUN apt-get update && apt-get install -y \
#    gcc \
#    g++ \
#    build-essential \
#    libffi-dev \
#    python3-dev \
#    curl \
#    && rm -rf /var/lib/apt/lists/*

# Set working directory
# WORKDIR /app/

# Set Hugging Face mirror
#ENV HF_ENDPOINT=https://hf-mirror.com

# Install Python packages
COPY . /app/

#RUN pip install --no-cache-dir -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple --no-deps --force-reinstall
RUN pip install --no-cache-dir -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple


#RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
RUN mkdir -p /app/logs

# Copy application code
#COPY docker/ ./docker/
#COPY src/ ./src/

# Set Python import path
#ENV PYTHONPATH=/app/src

# Expose port
EXPOSE 8000

# Start the docker
#CMD ["uvicorn", "memos.api.product_api:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
