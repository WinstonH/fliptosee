#!/bin/bash   
wget http://www.boutell.com/rinetd/http/rinetd.tar.gz  
tar zxvf rinetd.tar.gz  
cd rinetd  
mkdir -p /usr/man/man8  
make && make install
