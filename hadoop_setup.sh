#new update
# download the binaries
cd ~/
pwd
test -d hadoop-3.1.4 || wget https://downloads.apache.org/hadoop/common/hadoop-3.1.4/hadoop-3.1.4.tar.gz
tar -xf hadoop-3.1.4.tar.gz
mv hadoop-3.1.4 hadoop
cd hadoop/bin
export PATH=`pwd`:$PATH
cd ../etc/hadoop
echo "export JAVA_HOME=`dirname $(dirname $(readlink -f $(which javac)))`" >> hadoop-env.sh
cp /tmp/core-site.xml /tmp/mapred-site.xml /tmp/hdfs-site.xml /tmp/yarn-site.xml .
cd ../../..
export JAVA_HOME=`dirname $(dirname $(readlink -f $(which javac)))`
hadoop namenode -format
export HDFS_NAMENODE_USER="hduser"
export HDFS_DATANODE_USER="hduser"
export HDFS_SECONDARYNAMENODE_USER="hduser"
export YARN_RESOURCEMANAGER_USER="hduser"
export YARN_NODEMANAGER_USER="hduser"
./hadoop/sbin/start-all.sh
