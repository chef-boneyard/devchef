# omnibus-toolchain

This container can be used to build Ubuntu 14.04 debian packages for Omnibus projects.

To do so, simply run the following command from your project directory.

    docker run  --volume ./:/project devchef/omnibus-toolchain build delivery

## Git Cache Volume

Because different filesystems treat case (a vs A) differently, it's safter
to use a named Docker Volume to store your git cache.

    docker volume create --name $PROJECT-omnibus-git-cache

Next, you'll want to mount that volume to the git cache directory in your
container.

    docker run \
    --volume $PROJECT-omnibus-git-cache:/var/cache/omnibus/cache/git_cache \
    --volume ./:/project \
    devchef/omnibus-toolchain \
    bundle exec omnibus build $PROJECT

## Selective Cache expiration

If you want to selectively expire certain software definitions inside your
named cache volume, you can run the following command:

    docker run \
    --volume $PROJECT-omnibus-git-cache:/var/cache/omnibus/cache/git_cache \
    --volume ./:/project \
    --workdir /var/cache/omnibus/cache/git_cache/opt/$PROJECT \
    devchef/omnibus-toolchain \
    [COMMAND TBD]
