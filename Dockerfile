FROM python:3.10-slim AS base

WORKDIR /app/

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONFAULTHANDLER=1
ENV PIP_ROOT_USER_ACTION=ignore
ENV PYTHONPATH=/app/

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc

RUN pip install --upgrade pip && \
    pip install pipenv

COPY Pipfile Pipfile.lock requirements.txt ./

RUN pipenv install --dev --system
COPY . .

FROM base as production

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
