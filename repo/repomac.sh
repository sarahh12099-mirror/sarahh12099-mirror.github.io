rm -r -f Packages Packages.bz2 Packages.gz
dpkg-scanpackages -m . /dev/null >Packages
bzip2 -k Packages
gzip -k Packages