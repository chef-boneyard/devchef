# omnibus-toolchain

This container can be used to build Ubuntu 14.04 debian packages for Omnibus projects.

To do so, simply run the following command from your project directory.

    docker run  --volume ./:/project devchef/omnibus-toolchain build delivery

If you want to keep your omnibus cache locally so you don't have to rebuild it
every time, you can mount in a host directory to `/var/cache/omnibus/cache`

    docker run --volume ~/.dockercache/omnibus-cache:/var/cache/omnibus --volume ./:/project devchef/omnibus-toolchain build $PROJECT
