#!/usr/bin/env bash

INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$INSTALL_DIR"
curl -L -o "$INSTALL_DIR/pomodoro" "https://raw.githubusercontent.com/srsxnsh/pomodoro/main/pomodoro.sh"
chmod +x "$INSTALL_DIR/pomodoro"
if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
    echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
fi

echo 'Installed successfully.'

