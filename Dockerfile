# Stage 1: Build the frontend
FROM node:18 AS build

WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Ensure permissions for vite (only after dependencies are installed)
RUN chmod +x ./node_modules/.bin/vite

# Copy the rest of the application
COPY . .

# Build the production version of the React app
RUN npm run build

# Stage 2: Serve the app using Nginx
FROM nginx:alpine

## Copy custom Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the build output from the build stage to Nginx's public directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose the port on which Nginx is running
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]