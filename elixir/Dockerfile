FROM devchef/erlang-18:latest
MAINTAINER Chef Software, Inc. <docker@chef.io>

RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
       dpkg -i erlang-solutions_1.0_all.deb && \
       apt-get update

# Install Elixir
RUN apt-get install -y elixir

# Install Hex and rebar
RUN mix local.hex --force && \
      mix local.rebar --force

WORKDIR /usr/src/app

