#! /bin/bash

#Setup NodeJS repos. Vendor is providing a script to setup the repos.
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

#Install NodeJS
yum install nodejs -y

#Add application User
useradd roboshop

#Lets setup an app directory.
mkdir /app

#Download the application code to created app directory.
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip

#Lets download the dependencies.
cd /app
npm install

# vim /etc/systemd/system/catalogue.service

#Load the service.
systemctl daemon-reload

#Start the service.
systemctl enable catalogue
systemctl start catalogue

##### May or may not need this part / It's in 02_MongoDB.sh
yum install mongodb-org-shell -y

#Load Schema
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js

