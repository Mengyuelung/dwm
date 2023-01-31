#!/bin/sh

# ^c$var^ = fg color
# ^b$var^ = bg color

# load colors
. $HOME/.dwm/scripts/bar_themes/onedark

battery() {
  printf "^c$blue^  test"
}

clock() {
	printf "^c$black^^b$blue^ $(date '+%H:%M')  "
}


while true; do
  sleep 1 && xsetroot -name "$(battery) $(clock)"
done
