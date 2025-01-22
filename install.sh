#!/bin/sh

set -eu

install -Dm644 container@.service -t "${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user"

for f in */pod.yaml; do
  d="$(dirname "$f")"
  echo "Starting $d"
  systemctl --user enable --now "$(systemd-escape --template container@.service "$d")"
done
