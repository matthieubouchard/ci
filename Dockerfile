# BUILD PHASE
FROM node:alpine

WORKDIR /usr/app

COPY package*.json ./
RUN npm install
COPY . . 

RUN npm run build

# RUN PHASE (use nginx) and grab build dir from build phase & default nginx starts itself
FROM nginx
EXPOSE 80
COPY --from=0 /usr/app/build /usr/share/nginx/html 
