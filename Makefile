.PHONY: clean clean-test clean-build help test lint dist install install-uv install-dev-uv build-uv dist-uv venv-uv
.DEFAULT_GOAL := help

help:
	@echo "clean - remove all build and test artifacts"
	@echo "clean-build - remove build artifacts"
	@echo "clean-test - remove test artifacts"
	@echo "lint - check style with flake8"
	@echo "test - run tests quickly with the default Python"
	@echo "test-all - run tests on every Python version with tox"
	@echo "build - build source and wheel package"
	@echo "build-uv - build source and wheel package using uv"
	@echo "dist - package and upload to PyPI"
	@echo "dist-uv - package and upload to PyPI using uv"
	@echo "install - install the package to the active Python's site-packages"
	@echo "install-uv - install the package using uv"
	@echo "install-dev-uv - install development dependencies using uv"
	@echo "venv-uv - create a virtual environment using uv"

clean: clean-build clean-test

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr *.egg-info

clean-test:
	rm -fr .tox/
	rm -fr .pytest_cache
	rm -f .coverage
	rm -fr htmlcov/

lint:
	flake8 bunch tests

test:
	pytest

test-all:
	tox

build: clean
	python -m build

dist: clean
	python -m build
	twine check dist/*
	twine upload dist/*

install: clean
	pip install .

venv-uv:
	uv venv

install-uv: clean
	uv pip install .

install-dev-uv: clean
	uv pip install -e ".[dev]"

build-uv: clean
	uv pip install build
	python -m build

dist-uv: clean
	uv pip install build twine
	python -m build
	twine check dist/*
	twine upload dist/*
