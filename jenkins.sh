# install jenkins
# dwonload the jenkins repo
wget -O /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
# update 
yum upgrade -y
#install the epel
amazon-linux-extras install epel -y
# install the java
amazon-linux-extras install java-openjdk11 -y
# check the java version
java --version
# install the jenkins
yum install jenkins -y
# start the jenkins
systemctl start jenkins
# enable the jenkins
systemctl enable jenkins

echo " my second changes in the jenkins" 
