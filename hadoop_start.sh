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
chmod 777 /tmp/hadoop_setup.sh
su -c "echo -ne '\n' | ssh-keygen -t rsa -P \"\" "  hduser
su -c "cat \/home\/hduser\/.ssh\/id_rsa.pub >> \/home\/hduser\/.ssh\/authorized_keys" hduser
service ssh restart
su -c ". /tmp/hadoop_setup.sh" hduser
rm /tmp/hadoop_setup.sh
