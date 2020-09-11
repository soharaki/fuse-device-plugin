FROM golang:1.15-buster

COPY . /code/fuse-device-plugin
WORKDIR /code/fuse-device-plugin
RUN CGO_ENABLED=0 go build -mod vendor

FROM debian:buster-slim
COPY --from=0 /code/fuse-device-plugin/fuse-device-plugin /usr/bin/fuse-device-plugin

# replace with your desire device count
CMD ["fuse-device-plugin", "--mounts_allowed", "5000"]
