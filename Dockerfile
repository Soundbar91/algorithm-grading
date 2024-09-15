# set up python
FROM python:3.12-slim

# set workdir
WORKDIR /app

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
