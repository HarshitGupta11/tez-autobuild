test -d hadoop-3.1.4 || wget https://downloads.apache.org/hadoop/common/hadoop-3.1.4/hadoop-3.1.4.tar.gz 
\tar -xf hadoop-3.1.4.tar.gz

cd hadoop-3.1.4/bin
export PATH=$PATH:`pwd`
cd ../etc/hadoop

printf "export JAVA_HOME=`$(dirname $(dirname $(readlink -f $(which javac))))`" >> hadoop_env.sh
