import subprocess
import os

if "gen_files" not in os.listdir():
    os.mkdir("gen_files")

n = 2
docker_net = "my_net"

sl = "slave_{}"
mas = "master"

ls = [mas]
for i in range (1, n):
    ls.append(sl.format(i))

ip_space = "172.16.0.{}"
ips = []
for i in range(1,n+1):
    ips.append(ip_space.format(i))

with open("gen_files/conf_hosts", "w") as file:
    for i in range(n):
        file.write(ls[i]+" "+ips[i])
        file.write("\n")

#generate the ssh files
ssh_cmd_t = "echo -ne '\\n' | ssh-keygen -t rsa -P \"\" "
ssh_cmd = "ssh-copy-id -i /home/hduser/.ssh/id_rsa.pub hduser@{}"
with open("gen_files/gen_ssh.sh", "w") as file:
    file.write(ssh_cmd_t)
    file.write("\n")
    for i in range(n):
        file.write(ssh_cmd.format(ls[i]))
        file.write("\n")

run_cmd = "sudo docker run --network {} --ip {} -m \"4g\" --cpus=\"1\" --storage-opt size=10G --name {} base:v2"
for i in range(n):
    print(run_cmd.format(docker_net, ips[i], ls[i]))

run_cmd = "sudo docker cp gen_files {}:/tmp/"
for i in range(n):
    print(run_cmd.format(ls[i]))

#gen the docker execs to configure etc hosts and restart ssh
cmd = "sudo docker exec -it {} /bin/bash -c \"cat /tmp/gen_files/conf_hosts >> /etc/hosts ; service ssh restart \" "
for i in range(n):
    print(cmd.format(ls[i]))

#exceute the services on
ls = ls[::-1]
cmd = "sudo docker exec -it {} /bin/bash -c \". /tmp/gen_files/hadoop_start{}.sh\""
for i in range(n):
    if "master" in ls[i]:
        print(cmd.format(ls[i], "_master", "_master", "_master"))
    else:
        print(cmd.format(ls[i], "", "", ""))
