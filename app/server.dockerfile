FROM golang:1.16 as build

WORKDIR /go/src
COPY . .

ENV PATH="/go/bin:${PATH}"

RUN GOOS=linux go build -o . main.go


FROM ubuntu

WORKDIR /go/app

COPY . .

COPY --from=build ./go/src/main .

EXPOSE 8000

CMD ["./main"]