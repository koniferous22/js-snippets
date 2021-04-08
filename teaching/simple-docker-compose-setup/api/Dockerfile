FROM node:alpine

WORKDIR /usr/express-app
COPY package.json /usr/express-app/package.json
RUN npm i
COPY tsconfig.json /usr/express-app/tsconfig.json
COPY src /usr/express-app/src
RUN npm run build
EXPOSE 3000
CMD ["node", "dist/index.js"]
