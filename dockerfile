FROM node:20-slim

WORKDIR /usr/src/app

# RUN npm install -g npm@11.3.0

# Configurar npm para usar un mirror alternativo
# RUN npm config set registry https://registry.npmjs.org/

# Configurar npm para usar cache y retry
# ENV npm_config_cache=/tmp/npm-cache
# RUN mkdir -p /tmp/npm-cache
# ENV npm_config_fetch_retry_mintimeout=20000
# ENV npm_config_fetch_retry_maxtimeout=240000
# ENV npm_config_fetch_retries=5

# Instalar procps que contiene el comando ps
RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*

# COPY package.json ./
# COPY package-lock.json ./
COPY package*.json ./

# Aumentar el timeout de npm
RUN npm config set fetch-timeout 900000

RUN npm install
# Instalar con opciones para mejorar la estabilidad
# RUN npm install --prefer-offline --no-audit --no-fund --loglevel verbose


COPY . .

EXPOSE 3000