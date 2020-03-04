FROM golang:1.14.0-alpine3.11

RUN apk add --no-cache python py-pip

RUN pip install docker-squash

# WORKDIR /tmp
# RUN wget https://github.com/jwilder/docker-squash/releases/download/v0.2.0/docker-squash-linux-amd64-v0.2.0.tar.gz
# RUN tar -C /usr/local/bin -xzvf docker-squash-linux-amd64-v0.2.0.tar.gz

# RUN git clone http://github.com/jwilder/docker-squash

# WORKDIR /tmp/docker-squash
# RUN go build -o /usr/bin/docker-squash

ENV SOURCE_IMAGE_ID ''
ENV TARGET_IMAGE_TAG ''

ADD squash.sh /

ENTRYPOINT ["/squash.sh"]
