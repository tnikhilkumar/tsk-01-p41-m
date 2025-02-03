SimpleTimeService 

SimpleTimeService is a minimalist microservice that returns the current timestamp and the visitor's IP address in JSON format. 
This service is containerized using Docker and designed to run as a non-root user for security.

Features:
- Provides the current timestamp in UTC format.
- Returns the IP address of the requester.
- Lightweight and secure containerized deployment.

Runs as a non-root user inside the container.

Prerequisites

Ensure you have the following installed before proceeding:
- Docker

- Git (optional, for cloning the repository)

Getting Started:

1. Clone the Repository

git clone https://github.com/tnikhilkumar/tsk-01-p41-m.git


2. Build the Docker Image

docker build -t simple-time-service .

3. Run the Container

docker run -p 5000:5000 simple-time-service

4. Access the Service

Once the container is running, you can test the service by accessing it in a browser or using curl:

curl http://localhost:5000

Example Response:

{
  "timestamp": "2023-09-20T12:34:56.789Z",
  "ip": "172.17.0.1"
}

Publishing to Docker Hub

To make your Docker image available publicly, follow these steps:

1. Tag the Image

docker tag simple-time-service yourdockerhub/simple-time-service:latest

2. Push to Docker Hub

docker push yourdockerhub/simple-time-service:latest

Running from Docker Hub

If you want to pull and run the image directly from Docker Hub:

docker run -p 5000:5000 tnikhilkumar/simple-time-service:latest

Security and Best Practices:
- The application runs as a non-root user inside the container.
- The image is based on Alpine Linux to keep it lightweight and secure.
- .dockerignore file is included to avoid unnecessary files in the build context.

Repository Structure

simple-time-service/
│── app.py               # Application source code
│── Dockerfile           # Docker configuration
│── requirements.txt     # Dependencies
│── .dockerignore        # Docker ignore file
│── .gitignore           # Git ignore file
│── README.md            # Documentation

Thank you :)
