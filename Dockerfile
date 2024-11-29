# Use the official Python image as a base
FROM python:3.10-slim

# Set environment variables to minimize warnings
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Copy requirements file
COPY requirement.txt /app/

# Install dependencies
RUN pip install --upgrade pip && pip install -r requirement.txt

# Copy the application code
COPY webapplication /app/

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
