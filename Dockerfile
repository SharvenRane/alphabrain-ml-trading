# ---- Base Image ----
FROM python:3.11-slim

# ---- System deps ----
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# ---- Set Workdir ----
WORKDIR /app

# ---- Copy requirements first (for Docker caching optimization)----
COPY requirements.txt .

# ---- Install Python deps ----
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# ---- Copy project ----
COPY . .

# ---- Make src importable ----
ENV PYTHONPATH=/app/src

# ---- Default command ----
CMD ["bash"]
