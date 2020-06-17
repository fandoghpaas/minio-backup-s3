FROM alpine:latest

LABEL maintainer="Sorena Sarabadani <sorena.sarabadani@fandogh.cloud>"

ENV MC_HOST_SOURCE **None**
ENV MC_HOST_DESTINATION **None**
ENV SCHEDULE **None**

ADD . .

RUN sh setup.sh && rm setup.sh

CMD ["sh", "run.sh"]
