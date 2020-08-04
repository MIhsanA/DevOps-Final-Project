FROM node:10-alpine as build-step
COPY package.json package-lock.json ./
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
WORKDIR /app
COPY . .
RUN npm run build --prod
 
#stage2
FROM nginx:1.17.1-alpine
COPY --from=build-step /app/docs /usr/share/nginx/html
