#!/bin/sh
filelist=$(cat filelist)
state=0

# check if files exists
for i in $filelist
do
    if [ ! -s $i ] ; then echo $i is empty or does not exists, exiting ; exit 1 ; fi
done

# zip stuff
for i in $filelist
do
    tempstate=0
    echo zipping $i
    gzip -c $i | split -d -b 95M - $i.gz.
     tempstate=$?
    if [ "$tempstate" != 0 ] ; then $state=1 ; fi
done

state=$?
if [ "$state == 0" ]
then
    echo compression succesed, cleaning up
    for i in $filelist; do rm $i ; done
else
    echo compression failed, reverting to previous state
    for i in $filelist ; do rm $i.gz.* ; done
fi
