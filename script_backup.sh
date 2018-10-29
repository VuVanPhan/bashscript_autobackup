#!/bin/bash
# read data to other file
export $(cat variable.sh | grep -v ^# | xargs)
#source ./variable.sh
echo $PASS

## set Data
##USER=${1?Error: no user}
##SERVER=${2?Error: no ip server}
##PASS=${3?Error: no pass}
#
#
##declare -a ARRAY=($USER $SERVER $PASS)
#
##set data
#function getData {
#    echo "Enter user host : "
#    read USER
#    echo "Enter ip address host : "
#    read SERVER
#    echo "Enter password host : "
#    read PASS
#    ARRAY=($USER $SERVER $PASS)
#
#    # chưa hiểu vì sao khi khai báo array ntn thì ko gọi được khi ở function init
#    #declare -a ARRAY=($USER $SERVER $PASS)
#}
#
## set define config
#function defineConfig {
#    # current directory
#    CURDIR=$(pwd)
#    DESTDIR="/home/ubuntu/docker/magentodemo"
#    SSHPASS=$CURDIR"/sshpass.txt"
#
#    # config mysql server
#    #DBUSER=""
#    #LOCALHOST=""
#    #DATABASE=database-$(date +%-Y%-m%-d)+$(date +%-T).sql
#}
#
## install sshpass
#function installSshpass {
#    if [ ! -f $SSHPASS ]; then
#        # clone sshpass latest version
#        wget http://sourceforge.net/projects/sshpass/files/latest/download -O sshpass.tar.gz
#        # untar sshpass
#        tar -xvf sshpass.tar.gz
#        # go sshpass
#        cd sshpass-1.06
#        # configure sshpass, prepration install sshpass
#        ./configure
#        # install sshpass
#        make install
#        # uninstall sshpass
#        #make uninstall
#        # remove folder and tar sshpass
#        rm -rf ../sshpass.tar.gz ../sshpass-1.06
#        # write status sshpass
#        echo "sshpass-1.06" > $SSHPASS
#    fi
#}
#
## scp clone source
#cloneSource() {
#    # autologin with sshpass
#    sshpass -p ${ARRAY[2]} scp -r ${ARRAY[0]}@${ARRAY[1]}:$DESTDIR $CURDIR
#    # manual : scp -r user@idserver:[] []
#    #scp -r $USER@$SERVER:$DESTDIR $CURDIR
#    echo "Complete autobackup"
#}
#
## export database
#exportDatabase() {
#    # ssh user@idserver "[command]"
#    ssh $USER@$SERVER "pg_dump -U "$DBUSER" -h "$LOCALHOST" -C --column-inserts" >> $DATABASE
#}
#
## loginauto login SSH with sshpass
#function loginAutoSSH() {
#    # sshpass -p "password" ssh user@ipserver
#    sshpass -p $PASS ssh $USER@$SERVER
#}
#
## init process
#init() {
#    getData
#    defineConfig
#    installSshpass
#    cloneSource
#}
#
##init
##init $ARRAY
#
## define config
#function defineConfig {
#    SRCDIR="/var/www/html/magento1924/"
#    DESTDIR="/home/vuvanphan/Desktop/Backups/"
#    FILENAME=m-$(date +%-Y%-m%-d)-$(date +%-T).tar.gz
#    DATABASE=data-$(date +%-Y%-m%-d)-$(date +%-T).sql
#}
## remove all folder backups
#removeFolder() {
#    # check exits folder then remove
#    if [ -f $DESTDIR ]; then
#      rm -rf Backups
#    fi
#}
## create folder
#createFolder() {
#    cd ~/Desktop/
#    mkdir Backups
#    chmod -R a+rwx Backups/
#}
## create tar file
#function createTar {
#    tar -czvf $DESTDIR$FILENAME $SRCDIR
#    echo "Complete autobackup"
#}
## export mysql
#function mysqlDump {
#    mysqldump -u root -p magento > $DATABASE
#}
#
## localhost demo
## init process
#function init_localhost {
#    defineConfig
#    removeFolder
#    createFolder
#    createTar
#    #mysqlDump
#}
#
##init_localhost
