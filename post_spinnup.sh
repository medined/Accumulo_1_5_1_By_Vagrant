
CNT=`grep "affy-master" /etc/hosts | wc -l`
if [[ $CNT -eq 0 ]]; then
  echo "Please add affy-master, affy-slave1 and affy-slave2 to /etc/hosts"
  exit
fi

vagrant ssh master -c /vagrant/files/post_spinup_setup_ssh.sh 
vagrant ssh slave1 -c /vagrant/files/post_spinup_setup_ssh.sh
vagrant ssh slave2 -c /vagrant/files/post_spinup_setup_ssh.sh

vagrant ssh master -c "hadoop namenode -format"
vagrant ssh master -c "start-all.sh"
vagrant ssh master -c "hadoop fs -mkdir /user/vagrant"
vagrant ssh master -c "hadoop fs -mkdir /user/accumulo"

vagrant ssh master -c "zkServer.sh start"

echo "Waiting 30 seconds for Hadoop to settle."
sleep 30

vagrant ssh master -c "echo -e 'instance\nsecret\nsecret\n' | accumulo init --clear-instance-name"

echo "------------------------------------------------"
echo "Run the following two commands to start Accumulo"
echo "------------------------------------------------"
echo "vagrant ssh master"
echo "accumulo_home/bin/accumulo/bin/start-all.sh"
