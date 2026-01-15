FROM python:3.9-slim-bullseye

# System-Abhängigkeiten UND nützliche Tools installieren
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libffi-dev \
    libssl-dev \
    curl \
    # --- DEINE TOOLS ---
    procps \
    iputils-ping \
    vim-tiny \
    net-tools \
    # -------------------
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Installiere fhempy und Tuya-Libraries
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir fhempy tuya-iot-py-sdk tinytuya

EXPOSE 15733

CMD ["fhempy", "-p", "15733"]
