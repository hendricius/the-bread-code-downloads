.PHONY: release release-local build run stop clean start pr

# Pull the latest CI-built book files from the-sourdough-framework and commit
# them here (deploys to downloads.the-bread-code.io). Requires the `gh` CLI.
release:
	./bin/release.sh

# Same, but copy from a local checkout that has already run `make bake`
# (defaults to ../the-sourdough-framework).
release-local:
	./bin/release.sh --local

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

# Push the current branch and open a pull request against main. Never pushes
# main itself: every change reaches downloads.the-bread-code.io through a PR.
pr:
	@branch=$$(git branch --show-current); \
	if [ "$$branch" = "main" ]; then echo "make pr: switch to a branch first" >&2; exit 1; fi; \
	git push -u origin "$$branch" && gh pr create --base main --fill
