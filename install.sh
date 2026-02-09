#!/bin/sh
set -e

REPO="ArcBlock/useteamswarm"
INSTALL_DIR="${TEAMSWARM_INSTALL_DIR:-/usr/local/bin}"

# Detect platform
OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS" in
  Darwin) os="darwin" ;;
  Linux)  os="linux" ;;
  *)      echo "Unsupported OS: $OS" >&2; exit 1 ;;
esac

case "$ARCH" in
  arm64|aarch64) arch="arm64" ;;
  x86_64)        arch="x64" ;;
  *)             echo "Unsupported architecture: $ARCH" >&2; exit 1 ;;
esac

BINARY="teamswarm-${os}-${arch}"

# Get latest release tag
echo "Fetching latest release..."
TAG=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')

if [ -z "$TAG" ]; then
  echo "Failed to fetch latest release" >&2
  exit 1
fi

URL="https://github.com/${REPO}/releases/download/${TAG}/${BINARY}"

echo "Downloading TeamSwarm ${TAG} for ${os}-${arch}..."
TMPFILE="$(mktemp)"
curl -fsSL -o "$TMPFILE" "$URL"
chmod +x "$TMPFILE"

echo "Installing to ${INSTALL_DIR}/teamswarm..."
if [ -w "$INSTALL_DIR" ]; then
  mv "$TMPFILE" "${INSTALL_DIR}/teamswarm"
else
  sudo mv "$TMPFILE" "${INSTALL_DIR}/teamswarm"
fi

echo "TeamSwarm ${TAG} installed successfully!"
echo "Run 'teamswarm --help' to get started."
