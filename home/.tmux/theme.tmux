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

is_remote_option="@is-remote"
nesting_toggled_option="@nesting-toggled"

main() {
    default_txt="colour233" # Almost black
    default_pri="colour39"  # DeepSkyeBlue1
    default_alt="colour154" # GreenYellow
    default_sec="colour242" # Mid grey
    default_ter="colour236" # Dark grey

    local -r color_txt=$(get_tmux_option "@color_config_txt" "$default_txt")
    local -r color_pri=$(get_tmux_option "@color_config_pri" "$default_pri")
    local -r color_alt=$(get_tmux_option "@color_config_alt" "$default_alt")
    local -r color_sec=$(get_tmux_option "@color_config_sec" "$default_sec")
    local -r color_ter=$(get_tmux_option "@color_config_ter" "$default_ter")

    # Status update interval
    tmux set-option -g "status-interval" 1

    #tmux set-option -gq "status-position" "#{?$is_remote_option,bottom,top}"
    if [[ -v "$SSH_CLIENT" ]]; then
        tmux set-option -gq "status-position" "top"
    else
        tmux set-option -gq "status-position" "bottom"
    fi

    # Basic status bar colors
    tmux set-option -gq "status-style" "fg=$color_sec,bg=$color_txt"

    tmux set-option -g @local_icon "#[fg=colour220]🖵"
    tmux set-option -g @remote_icon "#[fg=colour220]📡"

    local -r local_icon=$(get_tmux_option "@local_icon" "")
    local -r remote_icon=$(get_tmux_option "@remote_icon" "")

    # Left side of status bar
    tmux set-option -gq "status-left-style" "bg=$color_ter,fg=$color_sec"
    tmux set-option -gq "status-left-length" 40
    local \
        status_left="#[fg=$color_txt,bg=#{?$nesting_toggled_option,$color_alt,$color_pri},bold]#{host_short} "
        status_left+="#{?$is_remote_option,$remote_icon,$local_icon} "
        status_left+="#[fg=#{?$nesting_toggled_option,$color_alt,$color_pri},bg=$color_sec,nobold]"
        status_left+="#[fg=$color_txt,bg=$color_sec] #(whoami) "
        status_left+="#[fg=$color_sec,bg=$color_ter]"
        status_left+="#[fg=$color_sec,bg=$color_ter] #I:#P "
        status_left+="#[fg=$color_ter,bg=$color_txt,nobold]"
    tmux set-option -gq "status-left" "$status_left"

    # Window status (middle of status bar)
    tmux set-option -gq "window-status-format" "  #I:#W#F  "
    local \
        status_mid="#[fg=$color_txt,bg=$color_ter]"
        status_mid+="#[fg=$color_pri,nobold] #I:#W#F "
        status_mid+="#[fg=$color_txt,bg=$color_ter,nobold]"
    tmux set-option -gq "window-status-current-format" "$status_mid"

    # Right side of status bar
    tmux set-option -gq "status-right-style" "bg=$color_txt,fg=$color_sec"
    tmux set-option -gq "status-right-length" 150
    local \
        status_right="#[fg=$color_ter,bg=$color_txt]" \
        status_right+="#[fg=$color_sec,bg=$color_ter] %H:%M:%S " \
        status_right+="#[fg=$color_sec,bg=$color_ter]" \
        status_right+="#[fg=$color_txt,bg=$color_sec] %d-%b-%y " \
        status_right+="#[fg=#{?$nesting_toggled_option,$color_alt,$color_pri},bg=$color_sec]" \
        status_right+="#[fg=$color_txt,bg=#{?$nesting_toggled_option,$color_alt,$color_pri},bold] #S #{?$nesting_toggled_option,on,off}"
    tmux set-option -gq "status-right" "$status_right"

    #set -g status-right ' #{?client_prefix,#[reverse]<Prefix>#[noreverse] ,}"#{=21:pane_title}" %H:%M %d-%b-%y'

    # Current window status
    tmux set-option -gq "window-status-current-style" "bg=$color_pri,fg=$color_ter"

    # Window with activity status
    tmux set-option -gq "window-status-activity-style" "bg=$color_txt,fg=$color_sec"

    # Window separator
    tmux set-option -gq "window-status-separator" ""

    # Window status alignment
    tmux set-option -gq "status-justify" "centre"

    # Pane border
    tmux set-option -gq "pane-border-style" "bg=default,fg=$color_sec"

    # Active pane border
    tmux set-option -g "pane-active-border-style" "bg=default,fg=$color_pri"

    # Pane number indicator
    tmux set-option -g "display-panes-colour" "$color_txt"
    tmux set-option -g "display-panes-active-colour" "$color_sec"

    # Clock mode
    tmux set-option -g "clock-mode-colour" "$color_pri"
    tmux set-option -g "clock-mode-style" 24

    # Message
    tmux set-option -g "message-style" "bg=$color_pri,fg=black"

    # Command message
    tmux set-option -g "message-command-style" "bg=$color_txt,fg=black"

    # Mode
    tmux set-option -g "mode-style" "bg=$color_pri,fg=$color_txt"
}
main





