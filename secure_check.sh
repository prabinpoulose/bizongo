## Script to check the webpage availability in the secure and non secure web ports (checking SSL for secure port) 

!#/bin/bash

function webacess()

{

FILE1 = /tmp/domain_ip_list.txt
PORT1 = 80
PORT2 = 443

function port80()
{
for i in `cat $FILE1`
do 
wget http://$FILE1:$PORT1
STA = $(echo $?)
if [[ $STA -eq 0 ]]
  then
    echo "$FILE1 : Webpage is accessible"
else
    echo "$FILE1 : Webpage is not accessible"
fi
 }
 
 function port443()
{
for i in `cat $FILE1`
do 
wget htpps://$FILE1:$PORT2
STA = $(echo $?)
if [[ $STA -eq 0 ]]
  then
    echo "$FILE1 : Secure webpage is accessible"
else
    echo "$FILE1 : Scure webpage is not accessible"
fi
 }

port80
port443

}

webaccess 2>&1 | tee -a /tmp/result.txt
