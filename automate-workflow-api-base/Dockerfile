FROM devchef/erlang-18:latest
MAINTAINER Chef Software, Inc. <docker@chef.io>

# needed for apps/delivery/priv/git_repo_template/hooks/post-receive
RUN apt-get update && \
      apt-get install --no-install-recommends -y ruby2.1 && \
      ln -s /usr/bin/ruby2.1 /usr/bin/ruby
