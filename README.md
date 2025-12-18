# Linstor Python Client Docker Image

### __IT IS NOT OFFICIAL PROJECT!!!__

__If you want to use official images and utils or/and support developers, please visit [Linstor Download Page](https://linbit.com/linbit-software-download-page-for-linstor-and-drbd-linux-driver/) or [Linstor Site](https://linbit.com/)__

## Usage

Run docker container to start linstor client

```bash
docker run --rm dantes2104/linstor-client-docker:latest [args]
```

### Image Variants

You can use all [possible variants](https://hub.docker.com/_/python#image-variants) of `python` docker image except `windowsservercore`.

Here is the list of available variants:
- `alpine`
- `trixie`
- `bookworm`
- `slim`
- `slim-trixie`
- `slim-bookworm`
- `rc`
- `rc-trixie`
- `rc-bookworm`
- `rc-alpine`
- `rc-slim`
- `rc-slim-trixie`
- `rc-slim-bookworm`

## Build

Before build please change base image in `Dockerfile` if it needed.

By default `Dockerfile` download source code from GitHub, but you can change it to your own repository just adding build arguments:
- `LINSTOR_API_GIT_URL` - Url to source code of common python library for Linstor API
- `LINSTOR_CLIENT_GIT_URL` - Url to source code of python Linstor client

```bash
docker build \
--build-arg LINSTOR_API_GIT_URL=https://example.com/source/linstor-api \
--build-arg LINSTOR_CLIENT_GIT_URL=https://example.com/source/linstor-client \
-t linstor-client-docker:latest .
```