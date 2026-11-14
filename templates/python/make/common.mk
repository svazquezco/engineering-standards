UV_RUN = $(UV) run --locked $(UV_GROUPS)
COMPOSE_RUN = $(COMPOSE) run --rm app uv run --locked $(UV_GROUPS)
