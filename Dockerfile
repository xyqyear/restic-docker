FROM alpine

ARG TARGETARCH

RUN apk add --update --no-cache ca-certificates fuse openssh-client tzdata jq

COPY restic_linux_* /

RUN chmod +x /restic_linux_${TARGETARCH} && \
    mv /restic_linux_${TARGETARCH} /restic && \
    rm /restic_linux_*

ENTRYPOINT ["/restic"]
