# Wir nutzen Python 3.9 auf Debian Bullseye als stabile Basis
FROM python:3.9-slim-bullseye

# 1. System-Abhängigkeiten und nützliche Tools für die Shell (ps, ping, etc.)
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

# 2. Arbeitsverzeichnis erstellen
WORKDIR /app

# 3. Python-Pakete installieren
# WICHTIG: paho-mqtt wird auf < 2.0.0 gepinnt, um den Callback-Fehler zu beheben
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir "paho-mqtt<2.0.0" \
    fhempy \
    tuya-iot-py-sdk \
    tuya-sharing \
    tinytuya

# 4. Standard-Port für fhempy
EXPOSE 15733

# 5. Startbefehl: fhempy mit Port und Log-Level DEBUG
# Das "-l DEBUG" sorgt für das ausführliche Logging, das du wolltest
CMD ["fhempy", "-p", "15733", "-l", "DEBUG"]
