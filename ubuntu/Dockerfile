FROM ubuntu:23.10

ENV HOSTNAME=ubuntu-gib-vpn

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
    expect \
    openconnect \
    iptables

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

ENTRYPOINT ["./run_both.sh"]
