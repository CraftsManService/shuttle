# Use Node.js 20 as the base image for modern package support
FROM node:20-slim

# Set the working directory inside the container
WORKDIR /app

# Copy package files first to optimize build times
COPY package*.json ./

# Install all dependencies (Shuttle needs both for the build process)
RUN npm install

# Copy the rest of your application code
COPY . .

# Match the port to your Back4App settings (must be 8080)
EXPOSE 8080

# Explicitly bind to 0.0.0.0 to allow external traffic
CMD ["node", "index.js", "--host", "0.0.0.0"]
