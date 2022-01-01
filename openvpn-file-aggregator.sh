#!/bin/bash
tempfile="/tmp/newfile.ovpn"
newfile="newfile.ovpn"
oldfile="openvpn.ovpn"
if [ $# -ne 0 ]
then
    oldfile=$1
if (( $# >= 2 ));
then
    newfile=$2
fi
fi
# --- ca certificate ---
# get certificate file name
txt=`sed -n -e "s/^.*ca //p" $oldfile` 
# read file and
# make \n become /n for next command
txt=`sed ':a;N;$!ba;s|\n|/n|g' $txt`
sed "s|^ca .*|<ca>\n$txt\n</ca>|" $oldfile > $tempfile

# --- client certificate ---
# get certificate file name
txt=`sed -n -e "s/^.*cert //p" $oldfile` 
# read file and
# make \n become /n for next command
txt=`sed ':a;N;$!ba;s|\n|/n|g' $txt`
sed -i "s|^cert .*|<cert>\n$txt\n</cert>|" $tempfile


# --- client key ---
# get key file name
txt=`sed -n -e "s/^.*key //p" $oldfile` 
# read file and
# make \n become /n for next command
txt=`sed ':a;N;$!ba;s|\n|/n|g' $txt`
sed -i "s|^key .*|<key>\n$txt\n</key>|" $tempfile


# replace all /n by \n
sed ':a;N;$!ba;s|/n|\n|g' $tempfile > $newfile
rm $tempfile
