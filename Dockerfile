FROM python:3.12-slim AS base

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential tree curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install poetry==2.0.1
RUN poetry config virtualenvs.create false && poetry install --no-root
