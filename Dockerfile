FROM alpine
RUN apk add --no-cache git tini openssh
RUN echo '0 * * * * /usr/local/bin/sync-repositories' > /etc/crontabs/root
WORKDIR /repositories
ADD sync-repositories.sh /usr/local/bin/sync-repositories
ADD start-syncer.sh /usr/local/bin/start-syncer
RUN chmod +x /usr/local/bin/sync-repositories /usr/local/bin/start-syncer
ENTRYPOINT ["tini", "--"]
CMD ["start-syncer"]
