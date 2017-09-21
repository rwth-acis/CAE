sudo apt-get install -y supervisor

sudo cp ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf

#absolute path is required here
sudo ln -sf $HOME/acis/CAE/conf/yjs.conf /etc/supervisor/conf.d/yjs.conf
sudo ln -sf $HOME/acis/CAE/conf/role.conf /etc/supervisor/conf.d/role.conf
sudo ln -sf $HOME/acis/CAE/conf/services.conf /etc/supervisor/conf.d/services.conf
sudo ln -sf $HOME/acis/CAE/conf/services_debug.conf /etc/supervisor/conf.d/services_debug.conf
sudo ln -sf $HOME/acis/CAE/conf/widgets.conf /etc/supervisor/conf.d/widgets.conf

#create the log folder if not already here
if [ ! -d "log" ]; then
    mkdir log
fi


if [ ! -d "CAE-Model-Persistence-Service" ]; then
  echo "=> Cloning CAE-Model-Persistence-Service"
  git clone https://github.com/rwth-acis/CAE-Model-Persistence-Service.git > /dev/null
  echo "DONE"
else 
  echo "=> CAE-Model-Persistence-Service already cloned."
fi

if [ ! -d "CAE-Simple-Model-Representation" ]; then
    echo "=> Cloning CAE-Simple-Model-Representation"
    https://github.com/rwth-acis/CAE-Simple-Model-Representation.git > /dev/null
    echo "DONE"
else 
    echo "=> CAE-Simple-Model-Representation already cloned."
fi

if [ ! -d "CAE-Model-Persistence-Service" ]; then
  echo "=> Cloning CAE-Model-Persistence-Service"
  git clone https://github.com/rwth-acis/CAE-Model-Persistence-Service.git > /dev/null
  echo "DONE"
else 
  echo "=> CAE-Model-Persistence-Service already cloned."
fi


if [ ! -d "syncmeta" ]; then
    echo " => Cloning Syncmeta" 
    git clone https://github.com/rwth-acis/syncmeta.git > /dev/null
    echo "DONE"
else 
    echo "=> syncmeta already cloned."
fi

if [ ! -d "CAE-Frontend" ]; then
    echo "=> Cloning CAE Frontend widget"
    git clone https://github.com/rwth-acis/CAE-Frontend.git > /dev/null
    echo "DONE"
else
    echo "=> CAE Frontend repository already cloned"
fi

if [ ! -d "CAE-WireframingEditor" ]; then
    echo "=> Cloning CAE-WireframingEditor"
    git clone https://github.com/rwth-acis/CAE-WireframingEditor.git > /dev/null
    echo "DONE"
else 
    echo "=> CAE-WireframingEditor already cloned."
fi
