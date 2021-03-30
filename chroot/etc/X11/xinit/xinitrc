# make my keyboard fast
xset r rate 200 30

# turn off my touchpad
xinput set-prop "${TOUCHPAD_DEVICE}" "Device Enabled" 0

# allow other users to use our X server
chmod 644 /run/rybalkin/public/xauthority

# remap insert into end for thinkpad x250
xmodmap -e "keycode 118 = End NoSymbol End"

# now run fluxbox
startfluxbox
