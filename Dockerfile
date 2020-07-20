FROM plugins/base:linux-amd64
LABEL maintainer="Nero <backnero@gmail.com>" \
  org.label-schema.name="Drone Bash Git Push" \
  org.label-schema.vendor="NERO" \
  org.label-schema.schema-version="1.0"
ADD script.sh /bin/
RUN chmod +x /bin/script.sh
RUN apk add --no-cache ca-certificates git openssh curl perl && \
  rm -rf /var/cache/apk/*
ENTRYPOINT /bin/script.sh
