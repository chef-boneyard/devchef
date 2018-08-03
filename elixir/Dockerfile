FROM devchef/erlang-18:latest
MAINTAINER Chef Software, Inc. <docker@chef.io>


# Prior art from: https://github.com/c0b/docker-elixir/
# We do not install elixir via APT as the erlang base container we build on does not install
# erlang via APT. Attempting to install elixir will result in APT installing a second copy of
# erlang of the latest version, which is not what we want.
# elixir expects utf8.
# Pinned to Elixir 1.5.x as 1.6+ requires Erlang 19 or later.
ENV ELIXIR_VERSION="v1.5.3" \
  LANG=C.UTF-8

RUN set -xe \
  && ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/archive/${ELIXIR_VERSION#*@}.tar.gz" \
  && ELIXIR_DOWNLOAD_SHA256="0fc6024b6027d87af9609b416448fd65d8927e0d05fc02410b35f4b9b9eb9629" \
  && curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
  && echo "$ELIXIR_DOWNLOAD_SHA256  elixir-src.tar.gz" | sha256sum -c - \
  && mkdir -p /usr/local/src/elixir \
  && tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
  && rm elixir-src.tar.gz \
  && cd /usr/local/src/elixir \
  && make install clean

# Install Hex and rebar
RUN mix local.hex --force && \
      mix local.rebar --force

# Elixir imports and WORKDIR/APPDIR from the erlang base image.
