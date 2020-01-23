# copy to a centos base image to match other
# crunchy containers
FROM centos:7

ARG VERSION

LABEL vendor="Crunchy Data" \
	url="https://crunchydata.com" \
	release="${VERSION}" \
	org.opencontainers.image.vendor="Crunchy Data" \
	os.version="7.7"

RUN mkdir /app
ADD ./assets /app/assets
ADD ./pg_tileserv /app/

VOLUME ["/config"]

USER 1001
EXPOSE 7800

ENTRYPOINT ["/app/pg_tileserv"]
CMD []

# To build
# docker build -f Dockerfile --build-arg VERSION=$(VERSION) -t pramsey/pg_tileserv .

# To run
# docker run -dt -e DATABASE_URL=postgres://user:pass@host/dbname -p 7800:7800 pramsey/pg_tileserv