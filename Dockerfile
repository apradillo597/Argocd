FROM node:20-alpine AS build
WORKDIR /app
# copia package.json y package-lock.json si existe
COPY app/package*.json ./
# usa ci si hay lockfile; si no, install
RUN if [ -f package-lock.json ]; then npm ci --omit=dev; else npm install --omit=dev; fi
COPY app ./

FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY --from=build /app /app
USER node
EXPOSE 3000
CMD ["npm","start"]
