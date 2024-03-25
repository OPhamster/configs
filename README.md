# Setup

Management of configs and the manual symlinking is a bit tedious. Enter [stow](https://www.gnu.org/software/stow/).

1. Install stow
```bash
# Arch
$ pacman -Sv stow
# Ubuntu
$ apt install stow
```

2. Use stow to install configs
```bash
$ stow -S .
```
