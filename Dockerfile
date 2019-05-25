FROM elixir:1.8.1-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

# Install hex
RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

EXPOSE 4000

ENV APP_NAME wsl
RUN mkdir -p /$APP_NAME
COPY . /$APP_NAME
WORKDIR /$APP_NAME
