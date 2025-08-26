#docker build --network host --rm -t busyster996/gin-fancyindex:latest -f Dockerfile .
FROM golang:latest as builder

WORKDIR /go/src/gin-fancyindex
COPY . /go/src/gin-fancyindex

RUN go mod tidy && CGO_ENABLED=0 go build -ldflags "-w -s" -o gin-fancyindex cmd/main.go


FROM alpine:latest
COPY --from=builder --chmod=0777 /go/src/gin-fancyindex/gin-fancyindex /usr/local/bin/gin-fancyindex
RUN apk add --no-cache ca-certificates mailcap

EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/gin-fancyindex"]
