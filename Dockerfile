FROM golang:1-alpine as builder

WORKDIR /usr/src/app

COPY ./helloworld.go .

RUN go env -w GO111MODULE=off

RUN go build -o aplicativo

FROM hello-world
COPY --from=builder /usr/src/app .
CMD ["./aplicativo"]
