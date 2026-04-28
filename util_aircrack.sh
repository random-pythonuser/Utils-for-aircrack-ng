#!/bin/bash

type=$1
IFACE=${2:-wlan0}

cleanup() {
  echo "Cleaning up..."
  sudo airmon-ng stop "$IFACE"
  sudo systemctl restart NetworkManager
}

echo "Checking for missing packages..."
install_if_missing() {
    for pkg in "$@"; do
        if ! pacman -Q "$pkg" >/dev/null 2>&1; then
            echo "Installing $pkg..."
            sudo pacman -S "$pkg" --noconfirm
        else
            echo "$pkg is already installed."
        fi
    done
}

install_if_missing macchanger iw aircrack-ng

if [ "$type" = "init" ]; then
  read -p "Channel: " CH
  sudo airmon-ng check kill
  sudo ip link set "$IFACE" down
  sudo iw dev "$IFACE" set type managed
  sudo macchanger -r "$IFACE"
  sudo ip link set "$IFACE" up
  sudo airmon-ng start "$IFACE" "$CH"

elif [ "$type" = "mac" ]; then
  sudo ip link set "$IFACE" down
  sudo iw dev "$IFACE" set type managed
  sudo macchanger -r "$IFACE"
  sudo ip link set "$IFACE" up

elif [ "$type" = "monitor" ]; then
  sudo airmon-ng check kill
  sudo ip link set "$IFACE" down
  sudo iw dev "$IFACE" set type monitor
  sudo ip link set "$IFACE" up
  trap cleanup EXIT
  sudo airodump-ng "$IFACE"
  cleanup


elif [ "$type" = "clean" ]; then
  cleanup

else
  printf "init: changes mac and initiates monitor mode
mac: changes mac
monitor: initiates monitor mode and executes the airodump monitor
clean: stops monitor mode in the interface and restarts networkmanager \n"

fi