FROM alpine as copier

ARG TARGETARCH

COPY restic_linux_* /

RUN mv /restic_linux_${TARGETARCH} /restic

FROM alpine

RUN apk add --update --no-cache ca-certificates fuse openssh-client tzdata

COPY --from=copier /restic /restic

RUN chmod +x /restic

ENTRYPOINT ["/restic"]
