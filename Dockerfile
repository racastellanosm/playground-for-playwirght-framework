# Use the official Microsoft Playwright image as the base
FROM mcr.microsoft.com/playwright:v1.60.0-noble

# Create and set the working directory inside the container
WORKDIR /app

# Copy dependency manifests first to leverage Docker layer caching
COPY package.json package-lock.json ./

# Install standard npm dependencies
RUN npm ci

# Copy the rest of the project source files
COPY ./playwright.config.js ./
COPY ./tests /app/tests