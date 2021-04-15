su - kafka
git clone https://github.com/yahoo/CMAK.git
nano ~/CMAK/conf/application.conf
Add line
cmak.zkhosts="localhost:2181"
Change lines
kafka-manager.zkhosts="localhost:2181"
kafka-manager.zkhosts=${?ZK_HOSTS}
cmak.zkhosts="localhost:2181"
cmak.zkhosts=${?ZK_HOSTS}

cd ~/CMAK/ && ./sbt clean dist
cd ~/CMAK/target/universal && unzip cmak-3.0.0.5.zip
cd ~/CMAK/target/universal/cmak-3.0.0.5
bin/cmak


Create systemd unit:
nano /usr/lib/systemd/system/cmak.service

systemctl daemon-reload
systemcl enable cmak
systemc start cmak
