FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Set working directory
WORKDIR /code

# Copy project
COPY . /code

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# If your project itself needs to be installed
RUN pip install -e .

# Expose application port
EXPOSE 8005

# Python import path
ENV PYTHONPATH=/code

# Start application
CMD ["python", "main.py"]