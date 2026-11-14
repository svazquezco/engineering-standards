.DEFAULT_GOAL := help

UV ?= uv
COMPOSE ?= docker compose
UV_GROUPS ?= --all-groups
export UV UV_GROUPS

include make/common.mk
include make/external_tools.mk
include make/repo.mk
-include make/local.mk

.PHONY: help

help: ## Show available commands
	@echo "Available commands:"
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_-]+:.*##/ {printf "  make %-22s %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort -u
