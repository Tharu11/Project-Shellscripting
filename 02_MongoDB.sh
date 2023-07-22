#! /bin/bash

#Install MongoDB
ln -s mongo.repo /etc/yum.repo.d/mongodb.repo
yum install mongodb-org -y

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

#Start & Enable MongoDB Service
systemctl enable mongod
systemctl start mongod

#vim /etc/yum.repos.d/mongo.repo

#Restart the service to make the changes effected.
systemctl restart mongod

