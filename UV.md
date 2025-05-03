# Using UV with Bunch

[UV](https://github.com/astral-sh/uv) is a fast Python package installer and resolver written in Rust. This guide explains how to use UV with the Bunch project.

## Installation

First, install UV:

```bash
# Install with pip
pip install uv

# Or with Homebrew on macOS
brew install uv
```

## Development Setup

Set up a development environment with UV:

```bash
# Create and activate a virtual environment with uv
uv venv
source .venv/bin/activate  # On Unix/macOS
# OR
# .venv\Scripts\activate  # On Windows

# Install development dependencies
uv pip install -e ".[dev]"
```

## Common Commands

```bash
# Install the package in development mode
uv pip install -e .

# Install dev dependencies
uv pip install -r requirements-dev.txt

# Run tests
pytest

# Build the package
uv pip install build
python -m build
```

## Using Makefile Commands

The project's Makefile includes UV-compatible commands:

```bash
# Install with uv
make install-uv

# Install development dependencies with uv
make install-dev-uv

# Clean and rebuild with uv
make build-uv
```
