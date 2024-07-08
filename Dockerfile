FROM golang as builder

WORKDIR /usr/src/app

COPY hello.go .

RUN go build -o hello hello.go

FROM scratch

COPY --from=builder /usr/src/app/hello /hello

CMD ["/hello"]