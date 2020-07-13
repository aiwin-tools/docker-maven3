FROM maven:3.6-jdk-8

LABEL maintainer="javier.boo@aiwin.es"

RUN apt-get update && apt-get install -y jq zip git python3 python3-venv python3-pip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
  unzip /tmp/awscliv2.zip -d /tmp && \
  /tmp/aws/install

RUN pip3 install aws-sam-cli

RUN git clone https://github.com/aiwin-tools/devops-scripts.git "$HOME/scripts"

ADD settings.xml $MAVEN_CONFIG
