# ─────────────────────────────────────────────────────────────
# Stage 1: Build Stage
# Use Node.js to install dependencies and build with Parcel
# ─────────────────────────────────────────────────────────────
FROM node:20-alpine AS builder

# Set working directory inside the container
WORKDIR /app

# Copy package files first (layer caching - npm install only re-runs if package.json changes)
COPY package.json package-lock.json ./

# Install all dependencies (including dev dependencies needed for build)
RUN npm ci

# Copy the entire project source code
COPY . .

# Build the static website using Parcel
RUN npm run build

# ─────────────────────────────────────────────────────────────
# Stage 2: Production Stage
# Use lightweight Nginx to serve the static files
# ─────────────────────────────────────────────────────────────
FROM nginx:1.25-alpine

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built files from the builder stage into Nginx's web root
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80 (Nginx default HTTP port)
EXPOSE 80

# Start Nginx in the foreground (required for Docker)
CMD ["nginx", "-g", "daemon off;"]
