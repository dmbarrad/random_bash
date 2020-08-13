#!/bin/sh
# https://pastebin.com/aRCxdVgp
#url=`dmenu -p "URL/SEARCH:" <&-`
url=`tac ~/.cache/dweb_hist | dmenu -l 10 -p "URL/SEARCH:"` 
case "$url" in
	*\.*) echo "$url" >> ~/.cache/dweb_hist ; web "$url" ;;
	*) comnd=`echo "$url" | cut -d';' -f1`
	argument=`echo "$url" | sed "s/^.*;//"`
	case "$comnd" in 
		"g")echo "searx.lukesmith.xyz/?q=$argument" >> ~/.cache/dweb_hist ; web "searx.lukesmith.xyz/?q=$argument" ;;
		"r")echo "old.reddit.com/r/$argument" >> ~/.cache/dweb_hist ; web "old.reddit.com/r/$argument";; 
		"y")echo "invidious.snopyta.org/search?q=$argument"  >> ~/.cache/dweb_hist ; web "invidious.snopyta.org/search?q=$argument";;
		"i")echo "mail.google.com/mail/u/0/h/1mvzu1rdu8ahm/?s=q&q=$argument"  >> ~/.cache/dweb_hist ; web "mail.google.com/mail/u/0/h/1mvzu1rdu8ahm/?s=q&q=$argument";;
		"h")notify-send "`echo -e ' *:search\n g:search\n r:reddit\n y:youtube\n i:gmail'`";;
		*) echo "searx.lukesmith.xyz/?q=$argument" >> ~/.cache/dweb_hist ; web "searx.lukesmith.xyz/?q=$argument" ;;
	esac;;
esac
