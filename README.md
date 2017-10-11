# btcd-docker
[![](https://images.microbadger.com/badges/image/nargott/btcd-docker.svg)](https://microbadger.com/images/nargott/btcd-docker "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/nargott/btcd-docker.svg)](http://microbadger.com/images/nargott/btcd-docker "Get your own version badge on microbadger.com")

A [btcd] image ready to go! An alternative to bitcoind written in [Go].

Mount volumes for /root/.btcd and /root/.btcctl, it's where persistent data is kept.

If you choose to use docker-compose your .yml would look like this:
```
version: '2'
services:
  btcd:
  image: lcallero/btcd-docker:0.12.0-beta
    ports:
    - "8333:8333"
    - "8334:8334"
    volumes:
    - /opt/btcd/.btcd:/root/.btcd
    - /opt/btcd/.btcctl:/root/.btcct
```
'
And don't forget to write your own btcd.conf and btcctl.conf with user and password for RPC. 
* btcd.conf configuration file
```
[Application Options]
rpcuser=myuser
rpcpass=SomeDecentp4ssw0rd
rpclimituser=mylimituser
rpclimitpass=Limitedp4ssw0rd
```
* btcctl.conf configuration file
```
[Application Options]
rpcuser=myuser
rpcpass=SomeDecentp4ssw0rd
```
OR
```
[Application Options]
rpclimituser=mylimituser
rpclimitpass=Limitedp4ssw0rd
```

[Go]:https://golang.org/
[btcd]:https://github.com/btcsuite/btcd
