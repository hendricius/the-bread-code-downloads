.PHONY: download upload test-ssh build run stop clean start

# Load environment variables from .env file
include .env
export

test-ssh:
	@echo "Testing SSH connection to $(SSH_USER)@$(SSH_HOST)..."
	ssh -o ConnectTimeout=10 -o BatchMode=yes $(SSH_USER)@$(SSH_HOST) "echo 'SSH connection successful!'"

download:
	rsync -avzP $(SSH_USER)@$(SSH_HOST):"~/downloads/the-sourdough-framework/" ./the-sourdough-framework/
	rsync -avzP $(SSH_USER)@$(SSH_HOST):"~/downloads/the-sourdough-framework-recipes/" ./the-sourdough-framework-recipes/

upload:
	rsync -avzP ./the-sourdough-framework/ $(SSH_USER)@$(SSH_HOST):"~/downloads/the-sourdough-framework/"
	rsync -avzP ./the-sourdough-framework-recipes/ $(SSH_USER)@$(SSH_HOST):"~/downloads/the-sourdough-framework-recipes/"

# Docker commands
IMAGE_NAME := breadcode-downloads
CONTAINER_NAME := breadcode-downloads

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run -d --name $(CONTAINER_NAME) -p 8080:80 $(IMAGE_NAME)
	@echo "Running at http://localhost:8080"

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

clean: stop
	docker rmi $(IMAGE_NAME) || true

start: stop build
	@echo "Running at http://localhost:8080"
	docker run --rm --name $(CONTAINER_NAME) -p 8080:80 $(IMAGE_NAME)
