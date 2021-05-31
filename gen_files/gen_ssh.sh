echo -ne '\n' | ssh-keygen -t rsa -P "" 
ssh-copy-id -i /home/hduser/.ssh/id_rsa.pub hduser@172.16.0.1
ssh-copy-id -i /home/hduser/.ssh/id_rsa.pub hduser@172.16.0.2
ssh-copy-id -i /home/hduser/.ssh/id_rsa.pub hduser@172.16.0.3
