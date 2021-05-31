#new update
# download the binaries
cd /home/
cp /tmp/gen_files/gen_ssh.sh /home/hduser
chmod 755 gen_ssh.sh
./gen_ssh.sh 
cp /tmp/gen_files/hadoop-3.1.4.tar.gz /home/hduser
tar -xf hadoop-3.1.4.tar.gz
mv hadoop-3.1.4 hadoop
chown -R hduser /home/user/hadoop
cd hadoop/bin
export PATH=`pwd`:$PATH
cd ../etc/hadoop
echo "export JAVA_HOME=`dirname $(dirname $(readlink -f $(which javac)))`" >> hadoop-env.sh
cp /tmp/gen_files/core-site.xml /tmp/gen_files/mapred-site.xml /tmp/gen_files/hdfs-site.xml /tmp/gen_files/yarn-site.xml .
cd ../../..
export JAVA_HOME=`dirname $(dirname $(readlink -f $(which javac)))`
export HDFS_NAMENODE_USER="hduser"
export HDFS_DATANODE_USER="hduser"
export HDFS_SECONDARYNAMENODE_USER="hduser"
export YARN_RESOURCEMANAGER_USER="hduser"
export YARN_NODEMANAGER_USER="hduser"
export HADOOP_CONF_DIR="/home/hduser/hadoop/etc/hadoop"
rm /home/hadoop/etc/hadoop/workers
cp /tmp/gen_files/workers /home/hadoop/etc/hadoop
hdfs namenode -format
./hadoop/sbin/start-all.sh
