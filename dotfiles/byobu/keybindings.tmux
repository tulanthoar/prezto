#unbind-key -tvi-copy Enter
bind-key -n PPage copy-mode -ue
bind-key -t vi-copy Enter copy-pipe "xclip -i -sel primary > /dev/null ; tmux set window-active-style bg=default"
unbind-key p
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
unbind-key -n C-S-F3
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

unbind-key -n F6
unbind-key -n C-F6
unbind-key -n S-F12
unbind-key Space
unbind-key q
unbind-key l
unbind-key k
bind-key F1 list-keys
bind-key F2 display-panes \; split-window -h -c "#{pane_current_path}"
bind-key F3 display-panes \; split-window -v -c "#{pane_current_path}"
bind-key F4 detach-client
bind-key k switch-session -n
bind-key j switch-session -p
bind-key Space new-window -c "#{pane_current_path}"
bind-key l next-window
bind-key h previous-window
bind-key q kill-window
bind-key Tab last-window
bind-key y copy-mode \; run-shell 'tmux save-buffer - | xclip -i -sel clipboard > /dev/null'
bind-key p if 'tmux set-buffer "$(xclip -o -sel primary)"' 'tmux paste-buffer'
bind-key F11 set window-active-style bg=colour235 \; copy-mode
bind-key -n C-F11 set window-active-style bg=colour235 \; copy-mode
# bind-key F10 run-shell "tmux capturep -p > /tmp/nvimbuffer" \; new-window "nvim /tmp/nvimbuffer"
# bind-key -n Print run-shell "tmux capturep -p > /tmp/nvimbuffer" \; new-window "nvim /tmp/nvimbuffer"
bind-key -n C-F9 run-shell "tmux capturep -p > /tmp/nvimbuffer" \; new-window "nvim -RM /tmp/nvimbuffer"
bind-key m select-pane -m
bind-key M swap-pane
