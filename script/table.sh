#!/bin/bash

# removing old files.
rm -f table.g
rm -f rt*

rt1=rt1file
rt2=rt2file
rt3=rt3file

cat <<EOF | mged -c table.g
in tableSurface.s rpp 0 30 0 25 10 11
in tablesurface1.s rpp 0 30 0 25 1 2
in leg1.s rpp 0 2 0 2 0 1
in leg11.s rpp 0 2 0 2 0 12 
in leg2.s rpp 28 30 0 2 0 1
in leg22.s rpp 28 30 0 2 0 12
in leg3.s rpp 0 2 23 25 0 1
in leg33.s rpp 0 2 23 25 0 12
in leg4.s rpp 28 30 23 25 0 1
in leg44.s rpp 28 30 23 25 0 12
r table.r u tableSurface.s u tablesurface1.s u leg1.s u leg11.s u leg2.s u leg22.s u leg3.s u leg33.s u leg4.s u leg44.s 
mater table.r plastic 164 166 171 0
B table.r 
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
