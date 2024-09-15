# set up python
FROM python:3.12-slim

# set workdir
WORKDIR /app

# install gcc and openjdk
RUN apt-get update \
    && apt-get install -y gcc openjdk-11-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# copy .py
COPY . /app

# set venv
RUN python -m venv venv \
    && . venv/bin/activate \
    && pip install --no-cache-dir flask==2.3.2 gunicorn

# expose port
EXPOSE 5000

# start
CMD ["venv/bin/gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
