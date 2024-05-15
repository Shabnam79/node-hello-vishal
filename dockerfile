# Use the official Node.js image as the base image for the build stage
FROM node:14-alpine AS build

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the application dependencies
RUN npm ci

# Copy the application source code to the container
COPY . .

# Build the application
RUN npm run build

# Use the official Node.js image as the base image for the runtime stage
FROM node:14-alpine AS runtime

# Set the working directory to /app
WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app/build .

# Expose the port that the application will run on
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
