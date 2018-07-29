# spark

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#


FROM java:openjdk-8-jre

ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.11
ENV SPARK_VERSION 2.2.1
#ENV SPARK_HOME /opt/spark-"$SPARK_VERSION"-bin-hadoop${HADOOP_VERSION}
ENV HADOOP_VERSION 2.7

# Install Spark
RUN apt-get update
RUN apt-get install -y wget dnsutils
RUN wget -q https://archive.apache.org/dist/spark/spark-2.2.1/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -O /tmp/spark_${SPARK_VERSION}.tgz
RUN tar xfz /tmp/spark_${SPARK_VERSION}.tgz -C /opt
RUN rm /tmp/spark_${SPARK_VERSION}.tgz
RUN cd / && ln -s /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /spark

#ADD wait-for-it.sh /

# Supervisor config
#ADD supervisor/kafka.conf supervisor/zookeeper.conf /etc/supervisor/conf.d/

# 2181 is zookeeper, 9092 is kafka
EXPOSE 8080 7077 6066

#ENTRYPOINT echo hello $SPARK_HOME
