# install apache through shell script
# update 
sudo yum update -y
# install apache
sudo yum install httpd -y
# start apache
sudo systemctl start httpd
# enable the apche
sudo systemctl enable httpd