## https://wiki.debian.org/DHCP_Server
     apt install isc-dhcp-server
     vi /etc/default/isc-dhcp-server
         INTERFACESv4="enp0s8"
     service isc-dhcp-service stop
     vi /etc/dhcp/dhcpd.conf
         subnet 10.0.1.0 255.255.255.0 {
             range start-ip end-ip;
             option domain-name-servers dns-srv1.org;
             option domain-name "";
             option routers default-router-ip;
             option broadcast-address broadcast-ip;
             default-lease-time 6000;
             max-lease-time 7200;
         }
     service isc-dhcp-server start
     systemctl status isc-dhcp-server
     cat /var/lib/dhcp/dhcp.leases
