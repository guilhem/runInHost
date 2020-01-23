#!/bin/sh
exec nsenter -m/proc/1/ns/mnt -- "$@"
