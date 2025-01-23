# Use a smaller Node.js base image
FROM node:18-slim

# Set working directory
WORKDIR /src/app

# Copy package files and install dependencies
COPY ./package*.json ./

# Grant the "node" user permissions to the working directory
RUN chown -R node:node /src/app

# Switch to the "node" user
USER node

# Install dependencies
RUN npm install

# Copy application source code
COPY --chown=node:node . .

# Build the application
RUN npm run build

# Expose the app's running port
EXPOSE 5173

# Start the application
CMD ["npx", "vite", "preview", "--host", "0.0.0.0", "--port", "5173"]
