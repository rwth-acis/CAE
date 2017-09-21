cd CAE-Code-Generation-Service && ant jar
cd ..
cd CAE-Model-Persistence-Service && ant jar
cd ..
sudo sh scripts/copy_services.sh