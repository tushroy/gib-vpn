FROM alpine:3.19.1

ENV HOSTNAME=alpine-gib-vpn

RUN apk update && apk add --no-cache \
    expect \
    openconnect \
    iptables \
	tini && \
    rm -rf /var/cache/apk/*

COPY hipreport.sh .
COPY vpnc-script.sh .
COPY gib-vpn-script.sh .
COPY forwarding_script.sh .
COPY run_both.sh .

RUN chmod +x hipreport.sh
RUN chmod +x vpnc-script.sh
RUN chmod +x gib-vpn-script.sh
RUN chmod +x forwarding_script.sh
RUN chmod +x run_both.sh

ENTRYPOINT ["/sbin/tini", "-s", "./run_both.sh"]
