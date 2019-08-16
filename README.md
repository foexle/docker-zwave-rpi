#### Unstable => Current try to run with Alpine instead of huge Ubuntu images ####

## What is Z-Way?

_from [Z-Wave.me](https://www.z-wave.me/index.php?id=22):_

Every Smart Home in general and every Z-Wave Network in particular is controlled by a central controller and regardless
whether this is a large PC or a small router box, there is a software that implements the communication and control
function.

Z-Wave.me's flagship software to control Z-Wave networks is called Z-Way. Z-Way was the very first Z-Wave control
software certified by the Z-Wave Alliance back in March 2011.

### Integration with Z-Wave.me (ZME) UZB1 Stick

If you own a ZME UZB1 Stick, you can load it on the Z-Way server.
First you need to get the device vendor ID:
```sh
> id=lsusb | grep Sigma | awk '{print $6}' | cut -d':' -f1
```

now you can search for the mapping:
```sh
> portid=$(dmesg | grep $id | awk '{print $4}')
```
finally you'll can get the device:
```sh
> dmesg | grep $portid
```
Sample output:
```sh
[..]
[    5.811173] cdc_acm 1-1.2:1.0: ttyACM1: USB ACM device
```


```sh
> docker run --rm -it -p 8083:8083 --device=/dev/ttyACM1 ruimarinho/z-way
```

By loading your UZB1 Stick, you will be able to update its bootloader and firmware versions.

## Usage

### How to use this image

This image contains the server binary from the Z-Way software and by default runs the `z-way-server`.

```sh
❯ docker run --rm -it -p 8083:8083 foexle/zwave-rpi
```

Now go to http://127.0.0.1:8083 to open the UI.

## Supported Docker versions

This image is officially supported on Docker version 1.12, with support for older versions provided on a best-effort
basis.

[docker-hub-url]: https://hub.docker.com/r/foexle/zwave-rpi

## Thanks to
all the prep work by https://github.com/ruimarinho/docker-z-way

