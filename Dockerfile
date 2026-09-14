# 1. Use an official, lightweight Node.js environment
FROM node:20-alpine

# 2. Set a secure working directory inside the container
WORKDIR /usr/src/app

# 3. Copy dependency definitions first (optimizes build caching)
COPY package*.json ./

# 4. Install production-ready dependencies only
RUN npm ci --omit=dev

# 5. Copy the remaining application source files
COPY . .

# 6. Expose the port the app listens on
EXPOSE 3000

# 7. Define the runtime execution command
CMD ["npm", "start"]
