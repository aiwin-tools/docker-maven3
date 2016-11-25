docker-maven3
================

[Docker](https://www.docker.com/) image of [Apache Maven](https://maven.apache.org/) with necessary tools for build our projects

Apache Maven is a software project management and comprehension tool. This image adds several tools used by our integration and deployment processes, like jq, curl, etc

Usage
--------------

    docker run -it --rm --name my-maven-project -v "$PWD":/usr/src/mymaven -w /usr/src/mymaven aiwin/maven3-base:latest mvn clean install


Build
--------------

Run `build.sh` script to build and push the image to default location

    aiwin/maven3-base:latest

If you want to build and push the image to diferent location, define the following
variables before the execution of the script:

- REPOSITORY. Docker repository
- REGISTRY. Docker registry
- TAG. Tag or version
