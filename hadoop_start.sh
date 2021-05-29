#this will add the user and copy the  setup script in the tmp directory where it will
#be picked up hduser to execute
service ssh start
addgroup hadoop
mkdir /home/hadoop
useradd -g hadoop -s /bin/bash -d /home/hduser hduser
mkdir -p /app/hadoop/tmp
chown hduser /app/hadoop/tmp
chmod 750 /app/hadoop/tmp
test -d /tmp || mkdir -p /tmp
cp hadoop_setup.sh conf_files/hdfs-site.xml conf_files/mapred-site.xml conf_files/hdfs-site.xml /tmp
chmod 777 /tmp/hadoop_setup.sh
su -c hduser "./tmp/hadoop_setup.sh"
rm /tmp/hadoop_setup.sh
