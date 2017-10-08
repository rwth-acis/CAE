cd CAE-Model-Persistence-Service && ant jar
cd ..
cd CAE-Code-Generation-Service && ant jar
cd ..
sh scripts/copy_services.sh
sh scripts/permissions.sh