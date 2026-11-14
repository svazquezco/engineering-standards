.PHONY: check run test

check: pre-commit test ## Run all pre-commit hooks and tests (same as CI)

run: ## Build and run the application with Compose
	$(COMPOSE) up --build --exit-code-from app app

test: ## Run pytest
	$(COMPOSE_RUN) pytest
