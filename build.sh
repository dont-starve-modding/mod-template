#/bin/bash

echo "removing artifacts..."
rm -r build/

echo "creating directories..."
mkdir -p build/scripts
# mkdir -p build/images/inventoryimages
# mkdir -p build/anim

# echo "compiling animations..."
# "C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Mod Tools\mod_tools\scml.exe" some-animation/animation.scml .

echo "copying files and scripts..."
cp -r scripts/* build/scripts/
# cp images/inventoryimages/*.xml build/images/inventoryimages
# cp images/inventoryimages/*.tex build/images/inventoryimages
cp -r anim/*.zip build/anim/
cp my-mod-name.xml build/
cp my-mod-name.tex build/
cp *.lua build/

cp CONTRIBUTORS build/
cp LICENSE build/
cp README* build/

cp my-mod-name.png build/preview.jpg

echo "Finished."