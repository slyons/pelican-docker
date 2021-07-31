# pelican-docker
A Docker image to facilitate the building of Pelican-based blogs. By default it's meant to be
compatible with a specific set of blogs, but there's hooks to be able to modify the environment to your needs.

## Usage

Let's say you've got a Pelican blog at `/home/me/myblog`. You can use this Docker image as a self-contained build environment (both single-builds and continuous use during editing).

```shell
docker run --rm -it --name myblog -p8999:8000 \
    -v /home/me/myblog/:/home/app/pdock/ \
    slyons/pelican-docker:latest
```

This will start a continuous build server accessible at `http://localhost:8999`. You can modify any file you want in `/home/me/myblog` and they will be rebuilt and ready for a refresh in your browser.

The `CMD` for this image defaults to using the `develop_server.sh` script, but you can substitute your own to run a custom command in the prebuilt Pelican environment.

## Pre and post scripts

If you need to run anything before and after the above command, replace `/home/app/scripts/pre.sh` or `/home/app/scripts/post.sh` to use custom behavior. This can include installing custom packages or running post-build checks.