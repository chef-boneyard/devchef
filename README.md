## devchef

This is the source repository for Docker Images available on the [Docker Hub](https://hub.docker.com/u/devchef/).

These images are intended for local development purposes only. None of these images should be used in production scenarios.

## Requirements

In order to effectively utilize this repository, you must have the following:

1. Docker installed locally (either via [Docker Toolbox](https://www.docker.com/products/docker-toolbox) or the [Docker for Mac Beta](https://docs.docker.com/engine/installation/mac/#/docker-for-mac))

## Adding a new Image

These are the steps required to add a new image:

1. Create a directory for that image. The directory should share the image name. Add the Dockerfile to that directory.
2. Add build and push Makefile targets. Make sure to add the targets to `build-all` and `push-all` as well.
