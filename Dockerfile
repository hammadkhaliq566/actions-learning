# Use official Node.js LTS base image (slim version for smaller size)
FROM node:18-slim

# Set working directory inside container
WORKDIR /app

# Install production dependencies only, and avoid unnecessary layers
# Copy only the files required for 'npm install'
COPY package.json package-lock.json ./

# Install dependencies (production only if NODE_ENV is set)
RUN npm ci --omit=dev

# Copy only necessary files (avoiding .git, node_modules, etc.)
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
