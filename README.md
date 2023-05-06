# Statically linked eva

Statically linked [eva] container image

> ~ 2,6M

```bash
ghcr.io/awesome-containers/static-eva:latest
ghcr.io/awesome-containers/static-eva:0.3.1

docker.io/awesomecontainers/static-eva:latest
docker.io/awesomecontainers/static-eva:0.3.1
```

Slim statically linked [eva] container image and packaged with [UPX]

> ~ 881K

```bash
ghcr.io/awesome-containers/static-eva:latest-slim
ghcr.io/awesome-containers/static-eva:0.3.1-slim

docker.io/awesomecontainers/static-eva:latest-slim
docker.io/awesomecontainers/static-eva:0.3.1-slim
```

[eva]: https://github.com/nerdypepper/eva
[UPX]: https://upx.github.io/

<!--
```bash
image="localhost/${PWD##*/}"

podman build -t "$image:latest" .
podman build -t "$image:latest-slim" -f Containerfile-slim \
  --build-arg STATIC_EVA_IMAGE="$image" \
  --build-arg STATIC_EVA_VERSION=latest --no-cache .

echo "$image:latest"
podman inspect "$image:latest" | jq '.[].Size' | numfmt --to=iec
echo "$image:latest-slim"
podman inspect "$image:latest-slim" | jq '.[].Size' | numfmt --to=iec

```
-->
