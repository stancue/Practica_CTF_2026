#!/bin/bash
NEXT_LEVEL_PASSWORD=M15-relay-3a9f nohup sleep 300 > /dev/null 2>&1 &
echo "Proces de coordonare lansat, PID=$!"
echo "Inspecteaza /proc/$!/environ pentru parametrii de configurare."
