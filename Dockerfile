FROM node

WORKDIR /usr/src/app

COPY package.json .

COPY .env .env

RUN npm install

COPY . .

EXPOSE 3003

CMD ["node", "server.js"]