sudo apt-get update
sudo apt-get install tmux
# info: https://github.com/tmux-plugins/tpm#installation


tmux new-session \; split-window -h \; split-window -v \;
