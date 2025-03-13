FROM elixir:1.18-alpine

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /srv/app

COPY . .

ENV MIX_ENV=test

RUN mix deps.get && mix deps.compile

CMD mix test
