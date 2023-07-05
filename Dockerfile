FROM alpine:3.3

RUN apk add --update --no-cache git make musl-dev go apk-cron && rm -rf /var/cache/apk/*

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin


ADD crontab.txt /crontab.txt
ADD script.sh /script.sh
ADD worker.go /worker.go
COPY entry.sh /entry.sh
RUN chmod 755 /script.sh /entry.sh
RUN /usr/bin/crontab /crontab.txt

CMD ["/entry.sh"]