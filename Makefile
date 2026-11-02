.DEFAULT_GOAL := help

UV ?= uv

.PHONY: $(shell awk -F: '/^[a-zA-Z0-9_-]+:([^=]|$$)/ {print $$1}' $(MAKEFILE_LIST))

help: ## Show available commands
	@echo "Available commands:"
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_-]+:.*##/ {printf "  make %-22s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

check: pre-commit ## Run all repository validation

pre-commit: ## Run versioned hooks against all files
	$(UV) tool run --from 'pre-commit==4.7.*' pre-commit run --all-files
