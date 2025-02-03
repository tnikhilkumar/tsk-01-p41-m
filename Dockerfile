# Stage 1: Build environment
FROM python:3.9-alpine as builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Stage 2: Runtime environment
FROM python:3.9-alpine

WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /root/.local /root/.local
COPY ./app.py .

# Create non-root user and set permissions
RUN adduser -D appuser && \
    chown -R appuser:appuser /app

USER appuser
ENV PATH=/root/.local/bin:$PATH

EXPOSE 5000
CMD ["python", "app.py"]