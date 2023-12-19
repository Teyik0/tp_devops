FROM oven/bun:latest as builder
WORKDIR /app
COPY . .
RUN bun install

FROM oven/bun:latest
WORKDIR /app
COPY --from=builder /app ./

USER bun
EXPOSE 3000/tcp
ENTRYPOINT [ "bun", "run", "index.ts" ]
