echo -ne '\n' | ssh-keygen -t rsa -P "" 
ssh-copy-id -i /home/hduser/.ssh/id_rsa.pub hduser@master
ssh-copy-id -i /home/hduser/.ssh/id_rsa.pub hduser@slave_1
ssh-copy-id -i /home/hduser/.ssh/id_rsa.pub hduser@slave_2
