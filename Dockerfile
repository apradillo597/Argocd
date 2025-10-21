# Etapa de build 
FROM node:20-alpine AS build
WORKDIR /app
COPY app/package.json ./package.json
RUN npm ci --omit=dev
COPY app ./


# Etapa runtime 
FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY --from=build /app /app
USER node
EXPOSE 3000
CMD ["npm","start"]