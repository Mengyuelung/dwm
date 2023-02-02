#!/usr/local/bin/bash

# ^c$var^ = fg color
# ^b$var^ = bg color

# load colors
. $HOME/.dwm/scripts/bar_themes/onedark

version() {
  ver=$(freebsd-version)
  printf "^c$blue^^b$black^ "
  printf "^c$blue^ $ver"
}

ram() {
  ram_use=$(freecolor -o|sed -n '2p'|awk '{print $3}')
  ram_total=$(freecolor -o|sed -n '2p'|awk '{print $2}')
  ram_pec=$(awk 'BEGIN{printf "%.f", ('$ram_use'/'$ram_total')*100 }')
  printf "^c$blue^^b$black^ "
  printf "^c$blue^ $ram_pec%%"
}

battery() {
  printf "^c$blue^  test"
}

clock() {
	printf "^c$black^^b$blue^ $(date '+%H:%M')  "
}


while true; do
  sleep 1 && xsetroot -name "$(version) $(ram) $(battery) $(clock)"
done
