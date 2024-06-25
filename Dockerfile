FROM golang:1.22.4-alpine

MAINTAINER lyyym

ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64


WORKDIR /docker_mspace

# COPY go.* ./

# RUN go mod download

COPY . .

VOLUME ["/docker_mspace/app.yaml"]
#VOLUME ["/docker_mspace/cert/server.pem"]
#VOLUME ["/docker_mspace/cert/server.key"]
#COPY internal/conf/app.yaml /internal/conf/app.yaml

#RUN go build -o app ./internal/server/main.go

EXPOSE 8082

ENTRYPOINT ["/docker_mspace/main"]

