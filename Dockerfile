ARG ARCH

FROM multiarch/alpine:${ARCH}-latest-stable

RUN apk add --update --no-cache ca-certificates python py-pip curl build-base mosquitto-clients

RUN pip install speedtest-cli

RUN pip install dumb-init

COPY ./looper.sh /
RUN chmod +x /looper.sh

COPY ./speedtest.sh /
RUN chmod +x /speedtest.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/looper.sh"]
