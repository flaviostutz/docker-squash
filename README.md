# docker-squash

Docker container for reducing existing Docker images by squashing all layers into a single one.

If you have the control over image build, this utility is not needed, as you can achieve the same result by using multi stage builds, doing something like:

```
FROM oracle AS needs-squashing
ENV NEEDED_VAR some_value
COPY ./giant.zip ./somewhere/giant.zip
RUN echo "install giant in zip"
RUN rm ./somewhere/giant.zip

FROM scratch
COPY --from=needs-squashing / /
```

See more at https://stackoverflow.com/questions/45240239/using-docker-squash-in-docker-compose-when-building-images

## Usage

* Create a docker-compose.yml file:

```yml
version: '3.7'
services:
  docker-squash:
    image: flaviostutz/docker-squash
    environment:
      - SOURCE_IMAGE_ID=jwilder/whoami
      - TARGET_IMAGE_TAG=jwilder/whoami:squashed
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

* If the source image is not in the host cache yet, run ```docker pull jwilder/whoami```

* Run ```docker-compose up```

* Verify newly created image and compares sizes by ```docker images | grep whoami```

