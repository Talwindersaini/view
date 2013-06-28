#!/bin/bash

# removing old files.
rm -f chair.g
rm -f rt*

rt1=rt1file
rt2=rt2file
rt3=rt3file

cat <<EOF | mged -c chair.g
in tableSurface.s rpp 0 15 0 15 10 11
in leg1.s rpp 0 2 0 2 0 10
in leg2.s rpp 13 15 0 2 0 10
in leg3.s rpp 0 2 13 15 0 15
in leg4.s rpp 13 15 13 15 0 15
in back.s rpp 0 15 0 2 11 22
in arm1.s rpp 13 15 0 15 13 15
in arm2.s rpp 0 2 0 15 13 15
in leg5.s rpp 0 15 13 15 5 6
in tablesurface1.s rpp 0 20 20 40 10 11
in leg11.s rpp 0 2 20 22 0 12
in leg22.s rpp 18 20 20 22 0 12
in leg33.s rpp 0 2 38 40 0 12
in leg44.s rpp 18 20 38 40 0 12
in tablesurface2.s rpp 0 20 20 40 2 3
r chair.r u tableSurface.s u leg1.s u leg2.s u leg3.s u leg4.s u back.s u arm1.s u arm2.s u leg5.s u tablesurface1.s u leg11.s u leg22.s u leg33.s u leg44.s u tablesurface2.s
mater chair.r plastic 12 164 220 0
B chair.r 
ae 0 0 
saveview $rt1
ae 90 0
saveview $rt2
ae 270 90
saveview $rt3
EOF


chmod 755 $rt1
sh $rt1
pix-png < $rt1.pix > $rt1.png
chmod 755 $rt2
sh $rt2
pix-png < $rt2.pix > $rt2.png
chmod 755 $rt3
sh $rt3
pix-png < $rt3.pix > $rt3.png

sensible-browser index.html
