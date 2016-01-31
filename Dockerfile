#Kibana version 4.4.0

FROM fedora:20

MAINTAINER Yury Kavaliou <Yury_Kavaliou@epam.com>

ENV KIBANA_VERSION 4.4.0

COPY start-kibana.sh /usr/local/sbin/start-kibana.sh

RUN yum install -y tar \
    && cd /home \
    && curl -O http://download.elastic.co/kibana/kibana-snapshot/kibana-$KIBANA_VERSION-snapshot-linux-x64.tar.gz \
    && tar xzf kibana-$KIBANA_VERSION-snapshot-linux-x64.tar.gz \
    && rm -rd kibana-$KIBANA_VERSION-snapshot-linux-x64.tar.gz \
    && mv kibana-$KIBANA_VERSION-snapshot-linux-x64 kibana-$KIBANA_VERSION \
    && chmod 700 /usr/local/sbin/start-kibana.sh

EXPOSE 5601

ENTRYPOINT [ "/bin/bash", "/usr/local/sbin/start-kibana.sh" ]
