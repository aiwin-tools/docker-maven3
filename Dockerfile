FROM maven:3.3-jdk-8

RUN apt-get update && apt-get install -y jq zip python

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py" && \
  python /tmp/get-pip.py && \
  pip install awscli --ignore-installed six

ADD settings.xml $MAVEN_CONFIG

ADD sonar-properties.gradle $HOME

ADD quality_gate.sh $HOME

ADD check_build.sh $HOME
