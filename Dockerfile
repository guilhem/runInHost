FROM busybox
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
ARG NSENTER_UID
ENV NSENTER_UID ${NSENTER_UID:-0}
