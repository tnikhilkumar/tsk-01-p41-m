# Stage 1: Build environment
FROM python:3.9-alpine as builder

WORKDIR /app
COPY requirements.txt .

# Install dependencies in system directory
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Runtime environment
FROM python:3.9-alpine

WORKDIR /app

# Copy installed packages from builder
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
COPY ./app.py .

# Create non-root user
RUN adduser -D appuser && \
    chown -R appuser:appuser /app

USER appuser

EXPOSE 5000
CMD ["python", "app.py"]