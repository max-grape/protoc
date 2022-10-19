# Dockerized Protocol Buffers

## Additional modules:

- protoc-gen-go
- protoc-gen-go-grpc

## Installing a version from the official repo:
```
FROM golang:1.19.2

ENV PROTOC_ZIP=protoc-21.8-linux-x86_64.zip

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28 \
    && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2 \
    && apt update -y \
    && apt install -y curl unzip \
    && curl -OL https://github.com/google/protobuf/releases/download/v21.8/$PROTOC_ZIP \
    && unzip $PROTOC_ZIP -d protoc3 \
    && mv protoc3/bin/* /usr/local/bin/ \
    && mv protoc3/include/* /usr/local/include/ \
    && rm -rf $PROTOC_ZIP protoc3 \
    && apt remove -y curl unzip \
    && apt autoremove -y

CMD protoc --version
```

## Known issues

### Head denied:
```
Unable to find image 'ghcr.io/github.com/max-grape/protoc:latest' locally
docker: Error response from daemon: Head "https://ghcr.io/v2/github.com/max-grape/protoc/manifests/latest": denied: denied.
```
Solution:  
https://github.com/nektos/act/issues/1248#issuecomment-1221407412
```
I was encountering this issue because my PAT for ghcr.io had expired. Running docker logout ghcr.io allowed it to proceed as expected, without authentication.
```
