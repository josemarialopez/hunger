FROM node:alpine
ENV NODE_ENV=development
WORKDIR /app

COPY package.json ./
RUN npm install --silent
RUN npm install -g @angular/cli
COPY . .
EXPOSE 4200

CMD ["npm", "start"]