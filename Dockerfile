FROM maxmindinc/geoipupdate:v4.9

RUN apk add curl aws-cli bash
RUN aws --version

COPY entry.sh /usr/bin/entry.sh

ENTRYPOINT ["/usr/bin/entry.sh"]
