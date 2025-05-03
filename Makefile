.PHONY: clean clean-test clean-build help test lint dist install
.DEFAULT_GOAL := help

help:
	@echo "clean - remove all build and test artifacts"
	@echo "clean-build - remove build artifacts"
	@echo "clean-test - remove test artifacts"
	@echo "lint - check style with flake8"
	@echo "test - run tests quickly with the default Python"
	@echo "test-all - run tests on every Python version with tox"
	@echo "build - build source and wheel package"
	@echo "dist - package and upload to PyPI"
	@echo "install - install the package to the active Python's site-packages"

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
