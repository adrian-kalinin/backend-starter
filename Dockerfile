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

# Run application using `uv`
CMD ["uv", "run", "manage.py", "runserver", "0.0.0.0:8000"]
