# Use official Python image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy app files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Download spaCy language model
RUN python -m spacy download en_core_web_sm

# Expose port
EXPOSE 8010

# Run the app
CMD ["python", "app.py"]
