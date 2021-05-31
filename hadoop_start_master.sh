#this will add the user and copy the  setup script in the tmp directory where it will
#be picked up hduser to execute
service ssh start
addgroup hadoop
mkdir /app/hadoop/tmp
mkdir /home/hduser
useradd -g hadoop -s /bin/bash -d /home/hduser hduser
chown hduser /app/hadoop/tmp
chmod 750 /app/hadoop/tmp
chown hduser /home/hduser
test -d /tmp || mkdir -p /tmp
chmod 777 /tmp/gen_files/hadoop_setup.sh
su -c ". /tmp/gen_files/hadoop_setup_master.sh" hduser
