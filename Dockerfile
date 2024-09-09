# Use the latest official Python image
FROM python:3.11-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the local directory contents into the container
COPY . .

# Update the Alpine package list and install dependencies: gcc, libffi-dev, musl-dev, ffmpeg, and aria2c
RUN apk update && apk add --no-cache gcc libffi-dev musl-dev \
    && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main ffmpeg aria2 \
    && pip install --no-cache-dir -r requirements.txt

# Command to run Python script directly
CMD python3 main.py
