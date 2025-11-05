FROM node:18
WORKDIR /app
COPY patient-service.js .
RUN npm install express
EXPOSE 3000
CMD ["node", "patient-service.js"]
