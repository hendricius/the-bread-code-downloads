.PHONY: download upload test-ssh

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
