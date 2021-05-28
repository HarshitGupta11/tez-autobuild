#new update
# download the binaries
ssh-keygen -f ~/key_file -P ""
cat ~/key_file >> $HOME/.ssh/authorized_keys
ssh localhost
test -d hadoop-3.1.4 || wget https://downloads.apache.org/hadoop/common/hadoop-3.1.4/hadoop-3.1.4.tar.gz
tar -xf hadoop-3.1.4.tar.gz
cd hadoop-3.1.4/bin
export PATH=`pwd`:$PATH
cd ../etc/hadoop
echo "export JAVA_HOME=`dirname $(dirname $(readlink -f $(which javac)))`" >> hadoop-env.sh
mv /tmp/core-site.xml /tmp/mapred-site.xml /tmp/hdfs-site.xml .
cd ../../..
export JAVA_HOME=`dirname $(dirname $(readlink -f $(which javac)))`
hadoop namenode -format
export HDFS_NAMENODE_USER="hduser"
export HDFS_DATANODE_USER="hduser"
export HDFS_SECONDARYNAMENODE_USER="hduser"
export YARN_RESOURCEMANAGER_USER="hduser"
export YARN_NODEMANAGER_USER="hduser"
./hadoop/sbin/start-all.sh
#1 2 2 4 5 17
