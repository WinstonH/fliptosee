#!/bin/bash
 passwd='root'
 /usr/bin/expect <<-EOF
 set time 30
spawn ssh  -p 22 root@192.168.1.1
 expect {
 "*yes/no" { send "yes\r"; exp_continue }
 "*password:" { send "$passwd\r" }
 }
 expect "*#"
 send "sh dev.sh\r"
 expect "*#"
 send "uptime\r"
 expect "*#"
 send "exit\r"
 interact
 expect eof
