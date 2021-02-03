### Kubernetes Project

By: Valentin Quilliec, Arthur Lacombe, Dramane Kamissoko, Louis Benoist--Foucher

This project is a k8s implementation of chatcloud project :

https://github.com/batteurMDR/chatcloud-front (angular)
https://github.com/batteurMDR/chatcloud-back (node.js, socket.io)

And it required a redis and mariadb servers

## Project Structure

 - /back        contain all files for chatcloud-back
 - /backup      contain all files to backup the db server
 - /db          contain all files for mariadb
 - /front       contain all files for chatcloud-front
 - /monitoring  contain all files to monitor the cluster
 - /redis       contain all files for redis server
 - /secrets     contain all files for credentials

## Start

You can apply all files with :

```./setup.sh```