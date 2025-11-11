#!/bin/bash

LOG_FILE="/tmp/swaync_click.log"

exec &>> "$LOG_FILE"

echo "---"
echo "Click script triggered at: $(date)"
echo "Notification App Name (app_name): '$app_name'"
echo "Notification Body (body): '$body'"


if [ -n "$body" ] && [ -f "$body" ]; then
    echo "Body is a valid file. Attempting to open..."

    kolourpaint "$body"
    echo "Command 'kolourpaint \"$body\"' executed."
else
    echo "Body is NOT a valid file, or it is empty."

    echo "Check 1: '-n \"$body\"' (is not empty) -> $([ -n "$body" ] && echo 'true' || echo 'false')"
    echo "Check 2: '-f \"$body\"' (is a file) -> $([ -f "$body" ] && echo 'true' || echo 'false')"
fi
