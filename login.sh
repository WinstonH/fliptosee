#!/bin/bash
 passwd='123456'
 /usr/bin/expect <<-EOF
 set time 30
spawn ssh  root@192.168.1.100
 expect {
 "*yes/no" { send "yes\r"; exp_continue }
 "*password:" { send "$passwd\r" }
 }
 expect "*#"
 send "cd /home/trunk\r"
 expect "*#"
 send "ls\r"
 expect "*#"
 send "exit\r"
 interact
 expect eof
 EOF
