FROM golang:tip-alpine3.21 AS builder

WORKDIR /src

COPY ./main.go /src/

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o main main.go

FROM scratch

COPY --from=builder /src .

CMD [ "./main" ]