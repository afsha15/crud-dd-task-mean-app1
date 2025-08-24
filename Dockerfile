# backend/Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev || npm install --only=production
COPY . .
ENV PORT=8080
# Allow overriding Mongo URL at runtime (compose passes it)
ENV MONGO_URL=mongodb://mongo:27017/dd_db
EXPOSE 8080
CMD ["node", "server.js"]
