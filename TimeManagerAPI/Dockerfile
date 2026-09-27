FROM elixir:1.20.4-alpine
RUN apk add --no-cache postgresql-client nodejs npm
WORKDIR /app
COPY . .
RUN mix deps.get
RUN mix assets.setup
RUN mix assets.build
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
CMD ["mix", "phx.server"]