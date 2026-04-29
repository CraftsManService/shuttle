# Shuttle usually needs a modern Node environment
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy dependency files first for better caching
COPY package*.json ./

# Install all dependencies including devDependencies (Shuttle sometimes needs them for build)
RUN npm install

# Copy the rest of the project files
COPY . .

# Match the port Shuttle typically uses (check your config, often 8080 or 3000)
EXPOSE 8080

# The command to start Shuttle
CMD ["npm", "start"]
