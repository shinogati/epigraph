FROM python:3.13-bullseye
RUN apt-get update && apt-get install gcc python-setuptools -y && pip install poetry==1.8.5
ARG HOME=/home/appuser
RUN groupadd -g 999 appuser && useradd -r -u 999 -g appuser appuser
RUN mkdir -p ${HOME}/app && chown -R appuser:appuser ${HOME}
USER appuser

WORKDIR ${HOME}

COPY --chown=appuser:appuser pyproject.toml poetry.lock ./
RUN poetry install --no-dev

COPY . .

CMD exec poetry run uvicorn main:app --host 0.0.0.0 --port 8000