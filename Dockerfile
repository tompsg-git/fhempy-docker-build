FROM python:3.9-slim-bullseye

# System-Abhängigkeiten und Tools (ps, ping, etc.)
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libffi-dev \
    libssl-dev \
    curl \
    procps \
    iputils-ping \
    vim-tiny \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Installation der Libraries ohne Version-Pinning
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir fhempy tuya-iot-py-sdk tinytuya

EXPOSE 15733

# Startbefehl mit Debug-Logging
CMD ["fhempy", "-p", "15733", "-l", "DEBUG"]
