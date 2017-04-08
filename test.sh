git clone https://github.com/MNoya/LinuxVagrantSSH
cd LinuxVagrantSSH
vagrant up
vagrant ssh vm01

vm01$ ssh vm02 hostname
vm01$ exit

vagrant ssh vm02

vm02$ ssh vm01 hostname
vm02$ exit

cd ..
rm -R REPO