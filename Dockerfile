# 1. Basis-Image wählen (passend zu Ihrer Python-Version 3.13)
FROM python:3.13-slim

# 2. Arbeitsverzeichnis im Container festlegen
WORKDIR /app

# 3. uv im Container installieren (für schnelles Dependency Management)
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# 4. Projektdateien kopieren (app.py, pyproject.toml, uv.lock, etc.)
COPY . .

# 5. Abhängigkeiten exakt wie lokal installieren (nutzt uv.lock)
RUN uv sync --frozen

# 6. Den Port 5000 für Flask freigeben
EXPOSE 5000

# 7. Die App starten (uv run stellt sicher, dass die venv genutzt wird)
# --host=0.0.0.0 ist wichtig, damit der Container von außen erreichbar ist
CMD ["uv", "run", "flask", "run", "--host=0.0.0.0", "--port=5000"]