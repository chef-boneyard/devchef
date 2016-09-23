
This image is NOT intended for public or production use. It is intended only for
docker-compose environments where one of the services requires is a Chef Server.

## Using in Docker Compose

Here is an example of how to use this image in a Docker Compose file

```
version: '2'
services:
  chef-server:
    image: devchef/chef-server-12
    ports:
      - "443:443"
```

## Extracting Keys
Important keys are placed in the `/volumes/keys` volume. You can mount this
volume to your host or to another container.
