# Openvpn file aggregator
This script aggregate all openvpn files in one .ovpn file :
- ca certificate
- client certificate
- client key

This is often useful to upload your ovpn file when only one file is accepted, and your VPN provider gives you many, like Cyberghost.

This script is only available for linux.

## usage :
make sure to make script executable :
```sh
chmod +x openvpn-file-aggregator.sh
```

command and parameters : 

```sh
./openvpn-file-aggregator.sh [source.ovpn] [new_file.ovpn]
```
