FROM node:10-alpine as build-step
COPY package.json package-lock.json ./
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
WORKDIR /app
COPY . .
EXPOSE 4200
RUN npm run build --prod

CMD ng server --host 0.0.0.0
