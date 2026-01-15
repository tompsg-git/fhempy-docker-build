# Wir nutzen das offizielle fhempy Image als Basis
FROM fhempy/fhempy:latest

# Arbeitsverzeichnis setzen
WORKDIR /app

# Kopiere deine requirements.txt ins Image
COPY requirements.txt .

# Installiere die zusätzlichen Tuya-Abhängigkeiten
RUN pip install --no-cache-dir -r requirements.txt

# Der Rest bleibt wie im Original
