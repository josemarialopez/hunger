FROM node:latest
ENV NODE_ENV=development
WORKDIR /app

COPY package.json ./
COPY package-lock.json ./

RUN npm install --silent
RUN npm install -g @angular/cli
COPY . .
EXPOSE 80

CMD ["npm", "start"]