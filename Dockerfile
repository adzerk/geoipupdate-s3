FROM maxmindinc/geoipupdate:v4.9

RUN apk add curl aws-cli bash
RUN aws --version

COPY s3-update.sh /usr/bin/s3-update.sh

ENTRYPOINT ["/usr/bin/s3-update.sh"]
