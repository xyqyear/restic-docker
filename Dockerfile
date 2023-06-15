FROM alpine:latest AS restic

RUN apk add --update --no-cache ca-certificates fuse openssh-client tzdata jq

COPY restic_linux_${TARGETARCH} /restic

ENTRYPOINT ["/restic"]
