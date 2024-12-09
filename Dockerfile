# Base image
FROM node:alpine AS base

WORKDIR /usr/src/app

# Stage 1: Application Build
FROM base AS build

# Copy application source code
COPY . .

# Copy dependencies from the built deps image
COPY --from=my-app-deps /usr/src/app/node_modules ./node_modules

# Build the application
RUN npm run build

# Stage 2: Runtime Environment
FROM base AS runtime

WORKDIR /usr/src/app

# Copy built application
COPY --from=build /usr/src/app/dist ./dist

# Copy node_modules for runtime
COPY --from=my-app-deps /usr/src/app/node_modules ./node_modules

EXPOSE 3000

CMD ["node", "dist/main"]
