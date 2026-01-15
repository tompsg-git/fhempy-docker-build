# Wir nutzen ein offizielles Python-Image als sichere Basis
FROM python:3.9-slim-bullseye

# System-Abhängigkeiten installieren (wichtig für Tuya und Python-Builds)
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libffi-dev \
    libssl-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis
WORKDIR /app

# Installiere fhempy und die Tuya-Abhängigkeiten direkt
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir fhempy tuya-iot-py-sdk

# Startbefehl für fhempy
CMD ["fhempy"]
