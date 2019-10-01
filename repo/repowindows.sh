rm -r -f Packages Packages.bz2 Packages.gz
cd debs
for name in *; do
rm -r -f Temp $name.zip
cp $name $name.zip
mkdir Temp
winrar x -ibck $name.zip Temp
cd Temp
7z x $name
cat control >> ../../Packages
cd ../
size=($(stat -c%s $name))
md5=($(md5sum $name))
sha1=($(sha1sum $name))
sha256=($(sha256sum $name))
echo "Filename: debs/$name" >> ../Packages
echo "Size: "$size >> ../Packages
echo "MD5sum: "$md5 >> ../Packages
echo "SHA1: "$sha1 >> ../Packages
echo "SHA256: "$sha256 >> ../Packages
echo >> ../Packages
rm -r -f Temp $name.zip
done
cd ../
7z a -tbzip2 Packages Packages
7z a -tgzip Packages Packages