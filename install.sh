#!/bin/sh

set -eu

install -Dm644 container@.service -t "${XDG_DATA_HOME:-$HOME/.local/share}/systemd/user"

for f in */deployment.yaml; do
  d="$(dirname "$f")"
  echo "Starting $d"
  systemctl --user enable --now "$(systemd-escape --template container@.service "$d")"
done
