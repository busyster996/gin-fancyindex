.PHONY: build docker
build:
	@echo "Building gin-fancyindex"
	@go build -trimpath -ldflags "-w -s" -o bin/gin-fancyindex cmd/main.go

docker:
	@echo "Building docker image"
	@docker build -t gin-fancyindex:latest .