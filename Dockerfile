# Estagio de Construcao
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
COPY node_modules/. ./node_modules
RUN npm install
COPY . .
RUN npm run build

# Estagio de Producao
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
