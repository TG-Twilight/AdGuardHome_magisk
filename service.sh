#!/system/bin/sh
until [ $(getprop sys.boot_completed) = "1" ] ; do
  sleep 5
done
sleep 5
MODDIR=${0%/*}
chmod 0755 "$MODDIR/AdGuardHome"
chmod 0755 "$MODDIR/topdalao"
chmod 0755 "$MODDIR/update_sh"
chmod 0755 "$MODDIR/testing.sh"
chmod 0755 "$MODDIR/up"
chmod 0644 "$MODDIR/mode.conf"
chmod 0644 "$MODDIR/AdGuardHome.yaml"
sleep 3
"$MODDIR/AdGuardHome" > /dev/null 2>&1 &
up=1
while :;
do
if [ "$up" = "200" -o "$up" = "14400" ]; then
	"$MODDIR/up" > /dev/null 2>&1 &
	up=21
fi
sleep 3
"$MODDIR/topdalao" > /dev/null 2>&1
up="$(( $up + 1 ))"
done
