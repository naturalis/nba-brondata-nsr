#!/bin/sh
filelist=$(cat filelist)
state=0

# check if files exists
for i in $filelist
do
    if [ ! -s $i.gz.00 ] ; then  echo $i.gz.00 is empty or does not exists, exiting ; exit 1 ; fi
done

# unzip da stuff
for i in $filelist
do
    tempstate=0
    echo undecompressing $i
    cat $i.gz.* | zcat > ./$i
    tempstate=$?
    if [ "$tempstate" != 0 ] ; then $state=1 ; fi
done

# cleanup
state=$?
if [ "$state == 0" ]
then
    echo uncompression succesed, cleaning up
    for i in $filelist ; do rm $i.gz.* ; done
else
    echo uncompression failed, reverting to previous state
    for i in $filelist; do rm $i ; done
fi
