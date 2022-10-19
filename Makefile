PROJECT_NAME               = github.com/max-grape/protoc
IMAGE_GO                   = golang:1.19.2-alpine3.16
PROTOC_GEN_GO_VERSION      = 1.28
PROTOC_GEN_GO_GRPC_VERSION = 1.2
IMAGE                      = ghcr.io/$(PROJECT_NAME)
TAG                        = latest

build:
	@docker build \
		--build-arg IMAGE_GO=$(IMAGE_GO) \
		--build-arg PROTOC_GEN_GO_VERSION=$(PROTOC_GEN_GO_VERSION) \
		--build-arg PROTOC_GEN_GO_GRPC_VERSION=$(PROTOC_GEN_GO_GRPC_VERSION) \
		-t $(IMAGE):$(TAG) .
