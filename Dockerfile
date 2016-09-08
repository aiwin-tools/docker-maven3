FROM maven:3.3-jdk-8-alpine

RUN apk add --no-cache jq zip python

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py" && \
  python /tmp/get-pip.py && \
  pip install awscli --ignore-installed six
