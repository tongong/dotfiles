# backlight-control
Control the backlight brightness.

I had some problems with `xbacklight` in combination with the proprietary nvidia driver, so I wrote a replacement.

## Build
```sh
make
```

## Install
```sh
sudo make install
```

## Uninstall
```sh
sudo make uninstall
```

## Usage
```sh
$ backlight-control
Usage: backlight-control [+|-]<value>

Examples:
        backlight-control +10
        backlight-control -10
        backlight-control 50

```

`backlight-control +n` increases brightness by n%

`backlight-control -n` decreases brightness by n%

`backlight-control n` sets the brightness to n%
