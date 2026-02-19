# Use Node 18 (required by dependencies)
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy dependency files first (for Docker cache efficiency)
COPY package*.json ./

# Install production dependencies
RUN npm install --omit=dev

# Copy the rest of the source code
COPY . .

# Expose app port
EXPOSE 3000

# Start the app
CMD ["node", "src/index.js"]