#!/bin/bash

set -e

REPO="OprekerSejati/gitOprekerGo"

VERSION=$(curl -s https://api.github.com/repos/$REPO/releases/latest | grep tag_name | cut -d '"' -f 4)

OS=$(uname | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
  ARCH="amd64"
fi

if [ "$ARCH" = "aarch64" ]; then
  ARCH="arm64"
fi

FILE="gitoprekergo_${OS}_${ARCH}.tar.gz"

URL="https://github.com/$REPO/releases/download/${VERSION}/${FILE}"

curl -L $URL -o app.tar.gz

tar -xzf app.tar.gz

chmod +x gitoprekergo

sudo mv gitoprekergo /usr/local/bin/gitoprekergo

echo "Installed gitoprekergo ${VERSION}"
