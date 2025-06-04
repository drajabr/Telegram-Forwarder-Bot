FROM python:3.11-alpine

# Set working directory
WORKDIR /app

# Install dependencies (add build deps for Alpine)
RUN apk add --no-cache gcc musl-dev libffi-dev

# Install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy bot source
COPY . .

# Create required directories
RUN mkdir -p resources sessions media

# Set default env vars (overridden in compose)
ENV API_ID=""
ENV API_HASH=""
ENV PHONE_NUMBER=""

# Copy entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
