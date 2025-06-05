# Use the official Node.js image
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci

# Copy the full app source code
COPY . .

# Expose application port
EXPOSE 5006

# Run the application
CMD ["node", "index.js"]
