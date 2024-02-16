## GP PAN VPN docker example

Sample `docker-compose.yml` file

    version: "3.9"
    services:
      gib-vpn:
        image: gib-vpn
        container_name: gib-vpn
        environment:
          - GIB_VPN_USERNAME=
          - GIB_VPN_PASSWORD=
          - GIB_VPN_SERVER=
          - LISTEN_PORT=3389
          - DESTINATION_IP=
          - DESTINATION_PORT=3389
        ports:
          - 3389:3389
        cap_add:
         - NET_ADMIN
        devices:
         - /dev/net/tun:/dev/net/tun
        restart: unless-stopped
