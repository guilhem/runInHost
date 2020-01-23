# runInHost

![MicroBadger Size](https://img.shields.io/microbadger/image-size/guilhem/runinhost)
[![](https://images.microbadger.com/badges/version/guilhem/runinhost.svg)](https://microbadger.com/images/guilhem/runinhost "Get your own version badge on microbadger.com")

Run a command on your host from a container.

## Examples

### Docker

```
$ docker run --privileged --pid=host guilhem/runinhost ls /boot/grub/
fonts
gfxblacklist.txt
grub.cfg
grubenv
unicode.pf2
x86_64-efi
```

### Kubernetes

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: hello-host
spec:
  template:
    spec:
      hostPID: true # Facilitate entering the host mount namespace via init
      containers:
      - name: runInHost
        image: guilhem/runinhost
        imagePullPolicy: IfNotPresent
        securityContext:
          privileged: true # Give permission to nsenter /proc/1/ns/mnt
        args:
        - test
        - -f
        - /var/run/reboot-required
  backoffLimit: 4
```

## Under The hood

`runInHost` is a simple wrapper that call nsenter to execute command on host.
