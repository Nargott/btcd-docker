## -*- docker-image-name: "btcd:master" -*-
FROM golang:1.9-stretch

MAINTAINER kiberpunk.mail@gmail.com

RUN go env GOROOT GOPATH

RUN go get -u github.com/Masterminds/glide \
&& git clone https://github.com/btcsuite/btcd $GOPATH/src/github.com/btcsuite/btcd \
&& cd $GOPATH/src/github.com/btcsuite/btcd \
&& glide install \
&& go install . ./cmd/... \
&& btcd --version \
&& cd $GOPATH/src/github.com/btcsuite/btcd \
&& git pull && glide install \
&& go install . ./cmd/... \
&& btcctl --version

RUN go get -u github.com/Masterminds/glide \
&&  git clone https://github.com/btcsuite/btcwallet $GOPATH/src/github.com/btcsuite/btcwallet \
&&  cd $GOPATH/src/github.com/btcsuite/btcwallet \
&&  glide install \
&&  go install . ./cmd/... \
&&  cd $GOPATH/src/github.com/btcsuite/btcwallet \
&&  git pull && glide install \
&&  go install . ./cmd/...

ENTRYPOINT ["btcd"]
