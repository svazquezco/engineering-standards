FROM python:3.14-slim

COPY --from=ghcr.io/astral-sh/uv:0.13.6 /uv /uvx /usr/local/bin/

RUN apt-get update \
    && apt-get install --no-install-recommends -y git make libatomic1 \
    && rm -rf /var/lib/apt/lists/*

RUN git config --system --add safe.directory /workspace

ENV UV_PYTHON_DOWNLOADS=never
WORKDIR /workspace

CMD ["make", "help"]
