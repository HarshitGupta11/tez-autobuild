sudo docker run --network my_net --ip 172.16.0.1 -m "4g" --cpus="1" --storage-opt size=10G --name master base:v2
sudo docker run --network my_net --ip 172.16.0.2 -m "4g" --cpus="1" --storage-opt size=10G --name slave_1 base:v2
sudo docker run --network my_net --ip 172.16.0.3 -m "4g" --cpus="1" --storage-opt size=10G --name slave_2 base:v2
sudo docker cp gen_files master:/tmp/
sudo docker cp gen_files slave_1:/tmp/
sudo docker cp gen_files slave_2:/tmp/
sudo docker exec -it master /bin/bash -c "cat /tmp/gen_files/conf_hosts >> /etc/hosts ; service ssh restart " 
sudo docker exec -it slave_1 /bin/bash -c "cat /tmp/gen_files/conf_hosts >> /etc/hosts ; service ssh restart " 
sudo docker exec -it slave_2 /bin/bash -c "cat /tmp/gen_files/conf_hosts >> /etc/hosts ; service ssh restart " 
sudo docker exec -it slave_2 /bin/bash -c ". /tmp/gen_files/hadoop_start.sh"
sudo docker exec -it slave_1 /bin/bash -c ". /tmp/gen_files/hadoop_start.sh"
sudo docker exec -it master /bin/bash -c ". /tmp/gen_files/hadoop_start_master.sh"
