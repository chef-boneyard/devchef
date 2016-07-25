
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
Important keys should be placed in the `/keys` folder. On start, the contents of
`/keys` is copied to `/volumes/keys`, which is a volume that can be mounted on
other devices which may require access to them (i.e. Chef Manage).
