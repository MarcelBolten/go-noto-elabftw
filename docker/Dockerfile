# syntax=docker/dockerfile:1.7
FROM python:3-alpine3.19

COPY ../requirements.txt /tmp/requirements.txt

RUN apk upgrade -U -a && apk add --no-cache \
        bash \
        git \
        w3m \
    && mkdir -p /go-noto-elabftw/{cache,stats}/ \
    && git config --global --add safe.directory /go-noto-elabftw \
    && python3 -m venv /go-noto-elabftw/venv_fonty \
    && source /go-noto-elabftw/venv_fonty/bin/activate \
    && python3 -m pip install -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt \
    && echo "source /go-noto-elabftw/venv_fonty/bin/activate" >> /root/.bashrc \
    && echo "source /go-noto-elabftw/url.sh" >> /root/.bashrc \
    && echo "source /go-noto-elabftw/helper.sh" >> /root/.bashrc \
    && echo "source /go-noto-elabftw/categories.sh" >> /root/.bashrc \
    && echo "set +eu" >> /root/.bashrc

WORKDIR /go-noto-elabftw

CMD ["tail", "-f", "/dev/null"]
