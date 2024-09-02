# syntax=docker/dockerfile:1.7
FROM python:3-alpine3.20

COPY ../requirements.txt /tmp/requirements.txt

RUN apk upgrade -U -a && apk add --no-cache \
        bash \
        git \
        w3m \
        fontforge \
        jq \
    && mkdir -p /go-noto-elabftw/{cache,stats,fonts}/ \
    && git config --global --add safe.directory /go-noto-elabftw \
    && python -m venv /go-noto-elabftw/venv_fonty --system-site-packages \
    && source /go-noto-elabftw/venv_fonty/bin/activate \
    && python -m pip install -U pip \
    && python -m pip install -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt \
    && echo "source /go-noto-elabftw/venv_fonty/bin/activate" >> /root/.bashrc \
    && echo "source /go-noto-elabftw/scripts/url.sh" >> /root/.bashrc \
    && echo "source /go-noto-elabftw/scripts/helper.sh" >> /root/.bashrc \
    && echo "source /go-noto-elabftw/scripts/categories.sh" >> /root/.bashrc \
    && echo "set +eu" >> /root/.bashrc

WORKDIR /go-noto-elabftw

CMD ["tail", "-f", "/dev/null"]
