.DEFAULT_GOAL := help

UV ?= uv
COMPOSE ?= docker compose
UV_GROUPS ?= --all-groups
UV_RUN = $(UV) run --locked $(UV_GROUPS)

.PHONY: $(shell awk -F: '/^[a-zA-Z0-9_-]+:([^=]|$$)/ {print $$1}' $(MAKEFILE_LIST))

help: ## Show available commands
	@echo "Available commands:"
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_-]+:.*##/ {printf "  make %-22s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

check: pre-commit test ## Run all pre-commit hooks and tests (same as CI)

format: ## Format Python files
	$(UV_RUN) ruff format .

format-check: ## Check Python formatting
	$(UV_RUN) ruff format --check .

hooks-install: ## Install repository Git hooks
	$(UV_RUN) pre-commit install

lint: ## Check Python lint rules
	$(UV_RUN) ruff check .

lock: ## Generate or update uv.lock
	$(UV) lock

pre-commit: ## Run all pre-commit hooks on all files
	$(UV_RUN) pre-commit run --all-files

run: ## Build and run the application with Compose
	$(COMPOSE) up --build --exit-code-from app app

sync: ## Install locked project dependencies and all dependency groups
	$(UV) sync --locked $(UV_GROUPS)

test: ## Run pytest
	$(UV_RUN) pytest

typecheck: ## Check production types with Pyright
	$(UV_RUN) pyright
