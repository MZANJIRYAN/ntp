FROM alpine:3.19

RUN apk add --no-cache chrony tzdata && \
    mkdir -p /var/run/chrony /var/lib/chrony && \
    touch /var/lib/chrony/chrony.drift

COPY chrony.conf /etc/chrony/chrony.conf

EXPOSE 123/udp

CMD ["chronyd", "-d", "-f", "/etc/chrony/chrony.conf"]
