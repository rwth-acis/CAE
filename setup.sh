if [ ! -d "myCAE" ]; then
    mkdir myCAE
fi

sudo sh ./scripts/copy_services.sh
sudo sh ./scripts/copy_frontend.sh

#make sure supervisor service is running 
#check it with 
# sudo service supervisor status
chmod -v a+x ./scripts/permissions.sh
sh scripts/permissions.sh

sudo supervisorctl reread
sudo supervisorctl update