FROM node:11.10.0-alpine AS builder
ENV NODE_ENV=${NODE_ENV:-production}
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn install --production=false
COPY . .
RUN yarn build

# ---

FROM nginx:1.15.8-alpine
COPY --from=builder /usr/src/app/dist/ /usr/share/nginx/html/
COPY nginx/nginx.conf /etc/nginx/sites-available/loop.conf
