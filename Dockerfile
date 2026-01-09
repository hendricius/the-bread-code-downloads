# syntax=docker/dockerfile:1
# Nginx-based static file server for The Sourdough Framework downloads

# Stage 1: Clone repo and fetch LFS files
FROM alpine:latest AS lfs-fetch
RUN apk add --no-cache git git-lfs
WORKDIR /repo
RUN git lfs install && \
    git clone https://github.com/hendricius/the-bread-code-downloads.git . && \
    git lfs pull

# Stage 2: Nginx server
FROM nginx:alpine

# Install curl for health checks
RUN apk add --no-cache curl

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy download files from LFS-fetched stage
COPY --from=lfs-fetch /repo/the-sourdough-framework/ /usr/share/nginx/html/the-sourdough-framework/
COPY --from=lfs-fetch /repo/the-sourdough-framework-recipes/ /usr/share/nginx/html/the-sourdough-framework-recipes/

# Copy index page
COPY index.html /usr/share/nginx/html/index.html

# Create health check endpoint
RUN mkdir -p /usr/share/nginx/html/health && \
    echo "OK" > /usr/share/nginx/html/health/index.html

# Set proper permissions
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/health/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
