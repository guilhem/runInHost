#!/bin/sh
exec nsenter --mount=/proc/1/ns/mnt --setuid "$NSENTER_UID" -- "$@"
