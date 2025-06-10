# Lease IP

```bash
/ip dhcp-server lease print where mac-address=FF:FF:FF:FF:FF:FF

/ip dhcp-server lease set [find mac-address=FF:FF:FF:FF:FF:FF] address=192.168.1.2

/ip dhcp-server lease make-static [find mac-address=FF:FF:FF:FF:FF:FF]

/ip dhcp-server lease set [find mac-address=FF:FF:FF:FF:FF:FF] address=192.168.1.2
```

