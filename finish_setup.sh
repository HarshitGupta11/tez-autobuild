python3 setup.py
cd conf_files
cp `ls` ../gen_files
cd ..
sudo docker network create my_net
wget https://downloads.apache.org/hadoop/common/hadoop-3.1.4/hadoop-3.1.4.tar.gz
cp hadoop-3.1.4.tar.gz gen_files

chmod 755 hadoop_setup.sh
cp hadoop_setup.sh gen_files

chmod 755 hadoop_start.sh
cp hadoop_start.sh gen_files

chmod 755 hadoop_setup_master.sh
cp hadoop_setup_master.sh gen_files

chmod 755 hadoop_start_master.sh
cp hadoop_start_master.sh gen_files

chmod 755 gen_ssh.sh

#execute the gen script
chmod 777 gen_script.sh
./gen_script.sh
