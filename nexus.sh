# remove gzLogin as a root user
sudo su -
cd /opt
yum install tar wget -y
wget http://download.sonatype.com/nexus/3/nexus-3.15.2-01-unix.tar.gz
tar -zxvf nexus-3.15.2-01-unix.tar.gz
mv /opt/nexus-3.15.2-01 /opt/nexus
# add user
useradd nexus

#Give the sudo access to nexus user

visudo
nexus ALL=(ALL) NOPASSWD: ALL


#Change the owner and group permissions to /opt/nexus and /opt/sonatype-work directories.

chown -R nexus:nexus /opt/nexus
chown -R nexus:nexus /opt/sonatype-work
chmod -R 775 /opt/nexus
chmod -R 775 /opt/sonatype-work

#Open /opt/nexus/bin/nexus.rc file and  uncomment run_as_user parameter and set as nexus user.

vi /opt/nexus/bin/nexus.rc
# uncomment the first line and add the nexus 
run_as_user="nexus"

#Create nexus as a service

ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

#Switch as a nexus user and start the nexus service as follows.

su - nexus

#Enable the nexus services
sudo systemctl enable nexus

#Start the nexus service
sudo systemctl start nexus