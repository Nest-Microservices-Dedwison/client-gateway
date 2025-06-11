FROM node:20-slim

WORKDIR /usr/src/app

# Instalar procps que contiene el comando ps
RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*

# Configurar npm con timeouts más conservadores
RUN npm config set registry https://registry.npmjs.org/ && \
    npm config set fetch-timeout 600000 && \
    npm config set fetch-retries 5 && \
    npm config set fetch-retry-mintimeout 10000 && \
    npm config set fetch-retry-maxtimeout 120000 && \
    npm config set maxsockets 5

COPY package*.json ./

# Instalar dependencias con configuración optimizada
RUN npm ci --no-audit --no-fund --prefer-offline || \
    npm install --no-audit --no-fund


COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm run start:dev"] # Ejecuta el archivo compilado
