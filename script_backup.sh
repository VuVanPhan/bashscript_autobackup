#!/bin/bash
# set Data
#PASS=${1?Error: no pass}
#USER=${2?Error: no user}
#SERVER=${3?Error: no ip server}

# current directory
#CURDIR=$(pwd)
#DESTDIR="/home/ubuntu/docker/taigademo"

# config mysql server
#DBUSER=""
#LOCALHOST=""
#DATABASE=database-$(date +%-Y%-m%-d)+$(date +%-T).sql

# clone sshpass latest version
#wget http://sourceforge.net/projects/sshpass/files/latest/download -O sshpass.tar.gz
# untar sshpass
#tar -xvf sshpass.tar.gz
# go sshpass
#cd sshpass-1.06
# configure sshpass, prepration install sshpass
#./configure
# install sshpass
#make install
# uninstall sshpass
#make uninstall
# remove folder and tar sshpass
#rm -rf ../sshpass.tar.gz ../sshpass-1.06

# autologin with sshpass
#sshpass -p $PASS scp -r $USER@$SERVER:$DESTDIR $CURDIR

#echo "Complete autobackup"

init

# init process
init() {
   getdata
#   defineConfig
 #  installSshpass
  # cloneSource
}

# set data
getdata() {
   PASS=${1?Error: no pass}
   USER=${2?Error: no user}
   SERVER=${3?Error: no ip server}
   
}

# set define config
function defineConfig {
   # current directory
   CURDIR=$(pwd)
   DESTDIR="/home/ubuntu/docker/taigademo"

   # config mysql server
   #DBUSER=""
   #LOCALHOST=""
   #DATABASE=database-$(date +%-Y%-m%-d)+$(date +%-T).sql
}

# install sshpass
function instalSshpass {
   # clone sshpass latest version
   wget http://sourceforge.net/projects/sshpass/files/latest/download -O sshpass.tar.gz
   # untar sshpass
   tar -xvf sshpass.tar.gz
   # go sshpass
   cd sshpass-1.06
   # configure sshpass, prepration install sshpass
   ./configure
   # install sshpass
   make install
   # uninstall sshpass
   #make uninstall
   # remove folder and tar sshpass
   rm -rf ../sshpass.tar.gz ../sshpass-1.06
}

# scp clone source
cloneSource() {
   # autologin with sshpass
   sshpass -p $PASS scp -r $USER@$SERVER:$DESTDIR $CURDIR
   # manual : scp -r user@idserver:[] []
   #scp -r $USER@$SERVER:$DESTDIR $CURDIR
}

# export database
exportDatabase() {
   # ssh user@idserver "[command]"
   ssh $USER@$SERVER "pg_dump -U "$DBUSER" -h "$LOCALHOST" -C --column-inserts" >> $DATABASE
}

# loginauto login SSH with sshpass
function loginAutoSSH() {
   # sshpass -p "password" ssh user@ipserver
   sshpass -p $PASS ssh $USER@$SERVER
}

# localhost demo
# init process
function init_localhost {
   defineConfig
   removeFolder
   createFolder
   createTar
   mysqlDump
}

# define config 
function defineConfig {
   SRCDIR="/var/www/html/magento1924/"
   DESTDIR="/home/vuvanphan/Desktop/Backups/"
   FILENAME=m-$(date +%-Y%-m%-d)$(date +%-T).tar.gz
   DATABASE=data-$(date +%-Y%-m%-d)$(date +%-T).sql
}
# remove all folder backups
removeFolder() {
   # check exits folder then remove
   if [ -f $DESTDIR ]; then
      rm -rf Backups
   fi
}
# create folder
createFolder() {
   mkdir Backups
   chmod -R a+rwx Backups/
}
# create tar file
function createTar {
   tar -czvf $DESTDIR$FILENAME $SRCDIR
}
# export mysql
function mysqlDump {
   mysqldump -u root -p magento > $DATABASE
}
