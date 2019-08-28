FROM node:8.11
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY lerna.json ./

COPY ./packages/bitcore-build/package.json ./packages/bitcore-build/package.json
COPY ./packages/bitcore-build/package-lock.json ./packages/bitcore-build/package-lock.json
COPY ./packages/bitcore-client/package.json ./packages/bitcore-client/package.json
COPY ./packages/bitcore-client/package-lock.json ./packages/bitcore-client/package-lock.json
COPY ./packages/bitcore-lib/package.json ./packages/bitcore-lib/package.json
COPY ./packages/bitcore-lib/package-lock.json ./packages/bitcore-lib/package-lock.json
COPY ./packages/bitcore-lib-cash/package.json ./packages/bitcore-lib-cash/package.json
COPY ./packages/bitcore-lib-cash/package-lock.json ./packages/bitcore-lib-cash/package-lock.json
COPY ./packages/bitcore-mnemonic/package.json ./packages/bitcore-mnemonic/package.json
COPY ./packages/bitcore-mnemonic/package-lock.json ./packages/bitcore-mnemonic/package-lock.json
COPY ./packages/bitcore-node/package.json ./packages/bitcore-node/package.json
COPY ./packages/bitcore-node/package-lock.json ./packages/bitcore-node/package-lock.json
COPY ./packages/bitcore-p2p/package.json ./packages/bitcore-p2p/package.json
COPY ./packages/bitcore-p2p/package-lock.json ./packages/bitcore-p2p/package-lock.json
COPY ./packages/bitcore-p2p-cash/package.json ./packages/bitcore-p2p-cash/package.json
COPY ./packages/bitcore-p2p-cash/package-lock.json ./packages/bitcore-p2p-cash/package-lock.json
COPY ./packages/bitcore-stealth/package.json ./packages/bitcore-stealth/package.json
COPY ./packages/bitcore-stealth/package-lock.json ./packages/bitcore-stealth/package-lock.json
COPY ./packages/bitcore-wallet/package.json ./packages/bitcore-wallet/package.json
COPY ./packages/bitcore-wallet/package-lock.json ./packages/bitcore-wallet/package-lock.json
COPY ./packages/bitcore-wallet-client/package.json ./packages/bitcore-wallet-client/package.json
COPY ./packages/bitcore-wallet-client/package-lock.json ./packages/bitcore-wallet-client/package-lock.json
COPY ./packages/bitcore-wallet-service/package.json ./packages/bitcore-wallet-service/package.json
COPY ./packages/bitcore-wallet-service/package-lock.json ./packages/bitcore-wallet-service/package-lock.json

RUN ./node_modules/.bin/lerna bootstrap

COPY . .
COPY .env.example .env
COPY bitcore-docker.config.json bitcore.config.json
EXPOSE 3000
EXPOSE 3232
EXPOSE 3380
