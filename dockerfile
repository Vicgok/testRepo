FROM node:16-alpine as build
WORKDIR /app
COPY . .
RUN npm install && npm run build && npm install -g serve
RUN find . -mindepth 1 -maxdepth 1 -path ./dist -prune -o -exec rm -rf {} \;
EXPOSE 3000
CMD ["npx","serve","-s","dist"]