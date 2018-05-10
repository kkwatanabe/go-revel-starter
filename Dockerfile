# https://hub.docker.com/_/golang/
FROM golang:1.10

ENV GOPATH $GOPATH:/go/src

RUN apt-get update && \
    apt-get upgrade -y

# revel，revel-cli，gorm，go-sql-driveをインストール
RUN go get github.com/golang/dep/cmd/dep && \
    go get github.com/revel/revel && \
    go get github.com/revel/cmd/revel && \
    go get github.com/jinzhu/gorm && \
    go get github.com/go-sql-driver/mysql

# アプリケーションをマウントするためのディレクトリ
RUN mkdir /go/src/app

WORKDIR /go/src/app

EXPOSE 9000
