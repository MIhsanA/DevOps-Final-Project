FROM node:10-alpine as build-step
COPY package.json package-lock.json ./
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
RUN npm install
WORKDIR /app
COPY . .
EXPOSE 4200
RUN npm run build --prod

<<<<<<< HEAD
ENTRYPOINT ["ng","server","--host", "0.0.0.0"]
=======
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
>>>>>>> 035113c240ab4f96f26a6fa535eeed5e1bb5178e
