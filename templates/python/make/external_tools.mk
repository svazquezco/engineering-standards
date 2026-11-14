.PHONY: format format-check hooks-install lint lock pre-commit sync typecheck

format: ## Format Python files
	$(COMPOSE_RUN) ruff format .

format-check: ## Check Python formatting
	$(COMPOSE_RUN) ruff format --check .

hooks-install: ## Install repository Git hooks
	$(UV_RUN) pre-commit install

lint: ## Check Python lint rules
	$(COMPOSE_RUN) ruff check .

lock: ## Generate or update uv.lock
	$(UV) lock

pre-commit: ## Run all pre-commit hooks on all files
	$(UV_RUN) pre-commit run --all-files

sync: ## Install locked project dependencies and all dependency groups
	$(UV) sync --locked $(UV_GROUPS)

typecheck: ## Check production types with Pyright
	$(COMPOSE_RUN) pyright
