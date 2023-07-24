FROM golang:1.20

WORKDIR /app

COPY . .
#RUN apk --update-cache add sqlite3
RUN apt-get update && apt-get install sqlite3
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
RUN go install github.com/ktr0731/evans@latest
RUN export PATH="$PATH:$(go env GOPATH)/bin"
RUN go mod tidy
#RUN go run cmd/grpcServer/main.go
