set -g default-terminal "screen-256color" 
unbind p
bind y run "tmux save-buffer - | xclip -i -sel clipboard > /dev/null"
bind p run "tmux set-buffer \"$(xclip -o -sel clipboard)\"; tmux paste-buffer"
unbind-key -n F1
unbind-key -n F8
unbind-key -n F5
unbind-key -n F9
unbind-key -n M-F9
unbind-key -n M-F5
unbind-key -n C-F3
unbind-key -n M-F6
unbind-key -n M-IC
unbind-key -n C-F4
unbind-key -n C-F5
unbind-key -n C-F8
unbind-key -n C-F9
unbind-key -n C-F11
unbind-key -n S-F6
unbind-key -n S-F1
unbind-key -n S-F3
unbind-key -n S-F4
unbind-key -n S-F5
unbind-key -n S-F8
unbind-key -n S-F9
unbind-key -n S-F11
unbind-key -n M-S-F8
unbind-key -n C-S-F2
nbind-key -n C-S-F3
unbind-key -n C-S-F4
unbind-key -n C-S-F5
unbind-key -n C-S-F8
unbind-key -n C-S-F12
unbind-key -n M-NPage
unbind-key -n M-PPage
unbind-key -n M-Up
unbind-key -n M-Down
unbind-key -n M-Left
unbind-key -n M-Right
unbind-key -n S-Up
unbind-key -n S-Down
unbind-key -n S-Left
unbind-key -n S-Right
unbind-key -n M-S-Up
unbind-key -n M-S-Down
unbind-key -n M-S-Left
unbind-key -n M-S-Right
unbind-key -n C-S-F3
unbind-key -n F2

unbind-key -n M-F11

unbind-key -n F7
unbind-key -n S-F7
unbind-key -n S-F2
unbind-key -n C-F2
unbind-key -n C-a

unbind-key -n F3
unbind-key -n F4
bind-key -n C-F10 break-pane

unbind-key -n F6
unbind-key -n C-F6
set -g prefix F12
bind-key -n F11 new-window -c "#{pane_current_path}" \; rename-window -
bind-key -n S-F1 previous-window
bind-key -n F1 next-window
bind-key -n C-F11 detach-client
bind-key -n S-F11 kill-pane
bind-key -n F2 copy-mode
bind-key -n S-F2 paste-buffer
bind-key -n F10 display-panes \; split-window -h -c "#{pane_current_path}"
bind-key -n S-F10 display-panes \; split-window -v -c "#{pane_current_path}"
