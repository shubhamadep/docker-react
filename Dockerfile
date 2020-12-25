# This is the file which developers will have to deploy this app to production.

FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build



FROM nginx

# copy build folder from the builder phase at the top.
COPY --from=builder /app/build /usr/share/nginx/html
#we dont have to start nginx, because the default command for the nginx container does that for us.


