# external monitor brightness
# real backlight via DDC/CI (ddcutil) when available, else xrandr software dimming
#   bri            -> show current
#   bri 40         -> set 40%
#   bri+ / bri- [step]  -> +/- step (default 10)
# env: BRI_OUT (xrandr output, default: first connected non-eDP), BRI_DISPLAY (ddcutil --display n, default 1)
# ddcutil setup: sudo apt install ddcutil && sudo usermod -aG i2c $USER  (relogin; modprobe i2c-dev if no /dev/i2c-*)

__bri_out(){
	[ -n "$BRI_OUT" ] && { echo "$BRI_OUT"; return; }
	xrandr --query | awk '/ connected/ && $1 !~ /^eDP/ {print $1; exit}'
}

__bri_ddc(){
	command -v ddcutil >/dev/null && ddcutil --display "${BRI_DISPLAY:-1}" getvcp 10 >/dev/null 2>&1
}

__bri_get(){
	if __bri_ddc; then
		ddcutil --display "${BRI_DISPLAY:-1}" getvcp 10 --brief | awk '{print $4}'
	else
		xrandr --verbose --current | awk -v o="$(__bri_out)" '$1==o {f=1} f && /Brightness:/ {printf "%d\n", $2*100+0.5; exit}'
	fi
}

bri(){
	local v=$1 o
	if [ -z "$v" ]; then
		__bri_ddc && echo "ddc: $(__bri_get)%" || echo "xrandr $(__bri_out): $(__bri_get)%"
		return
	fi
	(( v < 5 )) && v=5
	(( v > 100 )) && v=100
	if __bri_ddc; then
		ddcutil --display "${BRI_DISPLAY:-1}" setvcp 10 "$v" && echo "ddc: $v%"
	else
		o=$(__bri_out)
		[ -z "$o" ] && { echo "no external output"; return 1; }
		xrandr --output "$o" --brightness "$(awk -v v="$v" 'BEGIN{printf "%.2f", v/100}')" && echo "xrandr $o: $v%"
	fi
}

function bri+ { bri $(( $(__bri_get) + ${1:-10} )); }
function bri- { bri $(( $(__bri_get) - ${1:-10} )); }
