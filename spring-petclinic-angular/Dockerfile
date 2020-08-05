FROM node:10-alpine as build-step
COPY package.json package-lock.json ./
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
WORKDIR /app
COPY . .
EXPOSE 4200
RUN npm run build --prod

CMD ng server --host 0.0.0.0

'''
FROM node:12.2.0
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@latest

# add app
COPY . /app


CMD ng serve --host 0.0.0.0 --port 4200 --disableHostCheck true
'''