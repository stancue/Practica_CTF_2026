#!/bin/bash

# relay-m19.sh - ruleaza permanent CA m19. Asteapta semnalul
# SIGUSR1; la primire, scrie parola pentru m20 intr-un fisier
# din home-ul propriu.

OUT="/home/m19/unlocked.txt"

on_signal() {
    echo "M20-history-6a1f" > "$OUT"
    chmod 644 "$OUT"
}
trap on_signal SIGUSR1

while true; do
    sleep 2
done
