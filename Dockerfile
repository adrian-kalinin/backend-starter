FROM python:3.13-slim-bookworm

# Install `uv` from official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set working directory
WORKDIR /app

# Install dependencies using settings and lockfile
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev --no-install-project

# Add python executable to path
ENV PATH="/app/.venv/bin:$PATH"

# Copy application into container
ADD . /app

# Expose server port
EXPOSE 8000

# Add entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Use entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
