#!/bin/bash
##USAGE ./sync_script.sh /home/nadarb/folder1   /home/nadarb/folder2          ####list the fodler path as arguemnt to the script 
##the script will go through all the folder and sync the folders to the $dumplock  directory

for i in "$@";
do

dumpdir=$(basename $i)
dumploc=/home/nadarb/dumpfile
if [ ! -d $dumploc/$dumpdir ];
then
mkdir -p $dumploc/$dumpdir
fi 

while [ ! -f $i/RTAComplete.txt ];
do
rsync -avz --exclude '$i/RTAComplete.txt' $i/ $dumploc/$dumpdir
done
rsync -avz --exclude '$i/RTAComplete.txt' $i/ $dumploc/$dumpdir
cp $i/RTAComplete.txt $dumploc/$dumpdir/
echo "----------------------------------------------------------------------"
echo "ALL THE FILES UNDER $i ARE COPIED"
echo "----------------------------------------------------------------------"

done
