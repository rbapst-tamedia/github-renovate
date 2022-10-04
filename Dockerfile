FROM node:16.17.1-alpine

# needed in npm run test
RUN apk add curl

COPY ./jest.config.js ./package.json ./package-lock.json /app/

WORKDIR /app

RUN mkdir src/
RUN npm install

COPY ./tsconfig.json /app/tsconfig.json
COPY ./tsoa.json /app/tsoa.json
COPY ./data /app/data
COPY ./src/ /app/src/

RUN npm run postinstall

EXPOSE 3000 9229

CMD ["npm", "run", "dockerdev"]
