FROM alpine
EXPOSE 5432

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk update && \
    apk add "libpq@edge<9.7" "postgresql-client@edge<9.7" "postgresql@edge<9.7" "postgresql-contrib@edge<9.7" && \
    rm -rf /var/cache/apk/*

COPY .cache/bin /u/bin/
COPY rc /rc

VOLUME /srv/postgres

CMD /u/bin/init /rc/inittab
