#! /bin/sh

#set bootargs console=ttyO2,115200n8 rootwait root=/dev/mmcblk0p2 rw mem=364M@0x80000000 mem=320M@0x9FC00000 vmalloc=500M notifyk.vpssm3_sva=0xBF900000 ip=off noinitrd vram=32M ti816xfb.vram=0:32M
#freetype-config

ifconfig eth0 192.168.12.147
route add default gw 192.168.12.1 eth0

sleep 1
/home/sitara/ti/load-hd-firmware.sh start

#fbset -g 1920 1080 1920 1080 32

sleep 1
/etc/init.d/38xx-demo
sleep 1

export DISPLAY=:0
#export LD_LIBRARY_PATH=/usr/local/XSGX/lib:/usr/lib/firefox-18.0:/usr/local/lib:/opt/gfxlibraries/gfx_rel_es6.x
export LD_LIBRARY_PATH=/usr/local/XSGX/lib:/usr/lib/firefox-18.0:/usr/local/lib

#mkfontdir /usr/share/fonts/TTF/
#xset fp+ /usr/share/fonts/TTF/
#xset fp rehash 

mkfontdir /usr/share/fonts/X11/misc	
mkfontdir /usr/share/fonts/X11/Type1
mkfontdir /usr/share/fonts/X11/100dpi
mkfontdir /usr/share/fonts/X11/75dpi
mkfontdir /usr/share/fonts/X11/encodings/large
mkfontdir /usr/share/fonts/truetype/freefont
mkfontdir /usr/share/fonts/truetype/openoffice
mkfontdir /usr/share/fonts/truetype/ttf-dejavu
mkfontdir /usr/share/fonts/type1/gsfonts
mkfontdir /usr/share/fonts/type1/mathml
mkfontdir /usr/share/fonts/extra

fc-cache
#fc-cache -v
#fc-list

sleep 3

/etc/init.d/rc.pvr start
#/usr/local/XSGX/bin/X -verbose -nolisten tcp -dpms -s off -config /usr/local/XSGX/etc/xorg.conf &> /dev/null &


sleep 1
pango-querymodules > /usr/local/etc/pango/pango.modules
gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
gdk-pixbuf-query-loaders > /usr/local/lib/loaders.cache
gtk-query-immodules-2.0 > /usr/local/lib/gtk-2.0/2.10.0/immodules.cache

#gtk-demo

sleep 1


sleep 1
echo 0 > /proc/sys/vm/swappiness
sleep 1

#xrandr --output default --mode 1920x1080 --scale 2x1
#xrandr --verbose --dpi 75

mkdir ~/.mozilla
cd ~/.mozilla
cp -r /mnt/flashdisk/local/.mozilla/* .
firefox &> /dev/null &
#firefox -private -safe-mode &
#firefox | logger (output to syslog)

sleep 3

#xset dpms 0 0 0
#xset -dpms
#xset s off