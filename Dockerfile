FROM maven:3.6-jdk-8

LABEL maintainer="javier.boo@aiwin.es"

RUN apt-get update && apt-get install -y jq zip git python3 python3-venv python3-pip gettext-base \
    && rm -rf /var/lib/apt/lists/*

COPY --from=amazon/aws-cli /usr/local /usr/local

RUN wget "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -O "/tmp/aws-sam-cli-linux-x86_64.zip" && \
  unzip /tmp/aws-sam-cli-linux-x86_64.zip -d /tmp/aws-sam-cli && \
  /tmp/aws-sam-cli/install
  
RUN git clone https://github.com/aiwin-tools/devops-scripts.git "$HOME/scripts"

ADD settings.xml $MAVEN_CONFIG/
