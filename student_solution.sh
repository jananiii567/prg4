#!/bin/bash

# SELinux Access Denial Practical
# Student Name:
# Register Number:

echo "===== SELinux Status ====="
getenforce
sestatus

echo "===== Creating Web Directory ====="
sudo mkidr -p /web
sudo mkdir -p /web/html
echo "===== Creating HTML File ====="
echo "<h1>SELinux Practical</h1>" | sudo tee /tee /web/h

echo "===== Setting Linux Permissions ====="
sudo chmod 755 /web
sudo chmod 755 /web/html
sudo chmod 644 /web/html/index.html

echo "===== Checking Initial Context ====="
ls -lZ /web/html/index.html


echo "===== Assigning Wrong SELinux Context ====="
sudo chcon -t user_home_t /web/html/index.html

echo "===== Checking Wrong Context ====="
ls -lZ /web/html/index.html

echo "===== Checking AVC Denials ====="
sudo ausearch -m AVC -ts recent 2>/dev/null

echo "===== Correcting SELinux Context ====="
sudo chcon -t httpd_sys_content_t /web/html/index.html


echo "===== Checking Correct Context ====="
ls -lZ /web/html/index.html


echo "===== Practical Completed ====="
