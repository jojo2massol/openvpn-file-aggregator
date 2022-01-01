# Openvpn file aggregator
aggregate all openvpn files in one .ovpn file :
- ca certificate
- client certificate
- client key
## usage :
make sure to make script executable :
```sh
chmod +x openvpn-file-aggregator.sh
```

command and parameters : 

```sh
./openvpn-file-aggregator.sh [source.ovpn] [new_file.ovpn]
```
