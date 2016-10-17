#!/usr/bin/env bash

source /load-omnibus-toolchain.sh

bundle install --without development
bundle exec omnibus $@
