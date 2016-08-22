FROM java

ENV SCALA_VERSION=2.11.8
RUN echo $SCALA_VERSION
RUN mkdir -p /usr/local/ \
    && curl -SL http://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz \
    | tar -zxvC /usr/local/
RUN apt-get update \
    && apt-get install apt-transport-https \
    && echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823 \
    && apt-get install -yy sbt \
    && rm -rf /var/lib/apt/lists/

RUN echo 'PATH=$PATH:/usr/local/scala-${SCALA_VERSION}/bin' >/root/.bashrc
