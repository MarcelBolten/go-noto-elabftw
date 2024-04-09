# syntax=docker/dockerfile:1.7
FROM python:3-alpine3.19

RUN apk upgrade -U -a && apk add --no-cache \
    bash \
    git

RUN mkdir /go-noto-elabftw
RUN git config --global --add safe.directory /go-noto-elabftw
WORKDIR /go-noto-elabftw
CMD ["tail", "-f", "/dev/null"]
