#!/usr/bin/env bash

set -e

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

get_tmux_option() {
    local option="$1"
    local default_value="$2"
    local option_value=$(tmux show-option -gqv "$option")
    if [ -z "$option_value" ]; then
            echo "$default_value"
    else
            echo "$option_value"
    fi
}

nesting_toggle_key_option="@nesting-toggle-key"
nesting_toggled_option="@nesting-toggled"

default_toggle_key="F12"

set_nesting_bindings() {
    local key_bindings=$(get_tmux_option "$nesting_toggle_key_option" "$default_toggle_key")
    local key
    for key in $key_bindings; do
        tmux bind-key -T root "$key" \
            set key-table off \\\; \
            set prefix None \\\; \
            if -F '#{pane_in_mode}' 'send-keys -X cancel' \\\; \
            set "$nesting_toggled_option" 1 \\\; \
            refresh-client -S \\\;

        tmux bind-key -T off "$key" \
            set -u key-table \\\; \
            set -u "prefix" \\\; \
            set "$nesting_toggled_option" 0 \\\; \
            refresh-client -S \\\;

    done
}

main() {
    set_nesting_bindings
}
main
