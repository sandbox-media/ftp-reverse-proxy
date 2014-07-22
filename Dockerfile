FROM quay.io/democracyworks/confd:latest
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

RUN add-apt-repository ppa:vbernat/haproxy-1.5
RUN apt-get update
RUN apt-get install -y haproxy

ADD run.sh /run.sh
RUN chmod +x /run.sh

ADD haproxy.toml /confd/conf.d/haproxy.toml
ADD haproxy.cfg.tmpl /confd/templates/haproxy.cfg.tmpl
ADD haproxy.bootstrap.cfg /etc/haproxy/haproxy.cfg

EXPOSE 80 21 57649 57650 57651 57652 57653 57654 57655 57656 57657 57658 57659

CMD ["/run.sh"]
