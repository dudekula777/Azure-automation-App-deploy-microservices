FROM node:18
WORKDIR /app
COPY appointment-service.js .
RUN npm install express
EXPOSE 3001
CMD ["node", "appointment-service.js"]
