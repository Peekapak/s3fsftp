FROM --platform=linux/arm64 atmoz_sftp:latest

COPY scripts/setup /scripts
COPY scripts/sftp.d /etc/sftp.d
COPY entrypoint.sh /override-entrypoint.sh

RUN apt-get update && apt-get -y install s3fs jq

EXPOSE 22

ENTRYPOINT ["/override-entrypoint.sh"]
