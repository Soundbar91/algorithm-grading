# set up python
FROM python:3.9-slim

# copy .py
COPY . /app

# set up flask
RUN pip install flask

# move dir
WORKDIR /app

# start
CMD ["python3", "-m", "flask", "run"]
