FROM golang:1.13 as builder

WORKDIR /app
COPY go.* ./
RUN go mod download
#RUN go get github.com/deckarep/golang-set
#RUN go get github.com/rs/zerolog/log
#RUN go get github.com/jmespath/go-jmespath
#RUN go get github.com/joliv/spark
#RUN go get github.com/beyondstorage/go-service-hdfs
#RUN go get github.com/VividCortex/gohistogram
#RUN go get github.com/json-iterator/go
#RUN go get github.com/ddliu/go-httpclient
RUN go mod tidy


COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -mod=readonly -v -o server

FROM alpine:3
RUN apk add --no-cache ca-certificates
COPY --from=builder /app/server /server
CMD ["/server"]