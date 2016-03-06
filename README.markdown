# Vapor Base App

Advanced base app for Vapor

### First Install

```shell
sudo npm install -g bower # Only if you don’t have bower installed already
bower install
./build
./.build/debug/App assets:install-toolchain
./.build/debug/App serve
```

### Subsequent Runs

```shell
swift build && ./.build/debug/App serve
```
