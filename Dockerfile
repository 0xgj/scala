FROM java

ENV SCALA_VERSION=2.11.8
RUN echo $SCALA_VERSION
RUN mkdir -p /usr/local/ \
    && curl -SL http://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz \
    | tar -zxvC /usr/local/
RUN echo 'PATH=$PATH:/usr/local/scala-${SCALA_VERSION}/bin' >/root/.bashrc
