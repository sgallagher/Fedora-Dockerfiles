FROM  fedora
MAINTAINER Stephen Gallagher <sgallagh@redhat.com>

RUN  yum -y update; yum clean all
RUN yum -y install ReviewBoard; yum clean all

EXPOSE 80

ADD setup-reviewboard.sh /setup-reviewboard.sh
RUN chmod +x /setup-reviewboard.sh

ADD run-reviewboard.sh /run-reviewboard.sh
RUN chmod +x /run-reviewboard.sh

RUN /setup-reviewboard.sh

CMD  ["/run-reviewboard.sh"]
