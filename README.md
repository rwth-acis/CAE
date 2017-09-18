# CAE
The Community Application Editor

CAE Core Components:
* [CAE-Templates](https://github.com/rwth-acis/CAE-Templates)
* [CAE-Frontend](https://github.com/rwth-acis/CAE-Frontend)
* [CAE-Code-Generation-Service](https://github.com/rwth-acis/CAE-Code-Generation-Service)
* [CAE-Model-Persistence-Service](https://github.com/rwth-acis/CAE-Model-Persistence-Service)
* [CAE-Simple-Model-Representation](https://github.com/rwth-acis/CAE-Simple-Model-Representation)
* ~~[CAE-GitHub-Proxy](https://github.com/rwth-acis/CAE-GitHub-Proxy)~~ (deprecated)

CAE Tools and Apps
* [CAE-WireframingEditor](https://github.com/rwth-acis/CAE-WireframingEditor)
* [CAE-Example-Application](https://github.com/rwth-acis/CAE-Example-Application)
* [CAE-DockerImage](https://github.com/rwth-acis/CAE-DockerImage)

[![Gitter](https://badges.gitter.im/rwth-acis/CAE.svg)](https://gitter.im/rwth-acis/CAE?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Using the scripts
1. Start with ```sh install.sh```.
    This script tries to install supervisor and clones all necessary repositories
2. Follow the installations instrutions in the corresponding repositories to build the las2peer services and ROLE widgets. The links to the install instructions can be found above or in the README file of the correspoinding repository.

3. If everything was build correctly just run ```sh setup.sh```. 
This will create a folder called __myCAE__ where you can find the builds of all services and widgets.
The __myCAE__ folder should consist of the following:
 * __etc__ property files of the services
 * __lib__ the libraries for the cae backend services
 * __service__ the cae backend services
 * __frontend__
    * __cae__ the cae widgets
    * __syncmeta__ the syncmeta widgets
    * __wireframe__ the wireframing editor widget

Check the folder structure and make sure eveything is there and your urls are set correctly.

4. Run ```sh start``` to open the supervisor frontend at http://localhost:9001 in your standard browser. From here you can manually start the services you want to work with. 
The following programs should be available:
* __role__ start the role service at http://127.0.0.1:8073.
* __services__ the las2peer network available at http://localhost:8080/.
* __services_debug__ the las2peer network available at http://localhost:8080/ in debug mode.
* __yjs__ the y-websockets-server at port 1234.
* __widgets__ the webserver to serve the widgets at http://127.0.0.1:8001.


__Note__
* Start either __services__ or __services_debug__ but not both otherwise you will get erros. They are both exactly the same with just one difference that you can attach the java remote debugger to debug the backend services with eclipse or intelliJ.
* The __widgets__ program requires the http-server module. You can get it by just running ```npm install -g http-server```. 

