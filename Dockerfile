FROM node:18

WORKDIR /app
COPY package.json package-lock.json /app/
RUN npm ci

COPY tsconfig.json newrelic.js /app/

COPY src/ /app/src

EXPOSE 8081

CMD ["node", "--no-lazy", "-r", "ts-node/register", "-r", "newrelic", "--preserve-symlinks", "./src/index.ts"]