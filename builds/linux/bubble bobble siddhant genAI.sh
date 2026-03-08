#!/bin/sh
printf '\033c\033]0;%s\a' bubble bobble siddhant genAI
base_path="$(dirname "$(realpath "$0")")"
"$base_path/bubble bobble siddhant genAI.x86_64" "$@"
