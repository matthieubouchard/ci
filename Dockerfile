# BUILD PHASE
FROM node:alpine as builder

WORKDIR /usr/app

COPY package.json .
RUN npm install
COPY . . 

RUN npm run build

# RUN PHASE (use nginx) and grab build dir from build phase & default nginx starts itself
FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html 
