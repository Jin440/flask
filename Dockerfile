FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt /app/

RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libxslt-dev \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libswscale-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000"]