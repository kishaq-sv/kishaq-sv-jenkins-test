FROM node:20-alpine
WORKDIR /usr/src/app

# Only copy package.json (No package-lock.json)
COPY package.json ./

# Standard clean installation that bypasses lockfile crashes
RUN npm install --omit=dev

COPY . .
EXPOSE 3000
CMD ["npm", "start"]

