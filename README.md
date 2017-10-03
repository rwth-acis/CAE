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
* [Syncmeta](https://github.com/rwth-acis/syncmeta)
* [ROLE SDK](https://github.com/rwth-acis/ROLE-SDK)

[![Gitter](https://badges.gitter.im/rwth-acis/CAE.svg)](https://gitter.im/rwth-acis/CAE?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Using the scripts
__Note__: These scripts are for developers who want/need to work on the CAE.
 If you just want to use the CAE, have a look at the [CAE-DockerImage](https://github.com/rwth-acis/CAE-DockerImage) repository. It automatically deploys a fully functional and configured instance of the CAE for you in a Docker container.
1. Start with ```sh install.sh```.
    This script tries to install and setup supervisor and clones all necessary repositories.
    Additionally you need a running ROLE server. Check out the [releases](https://github.com/rwth-acis/ROLE-SDK/releases) or build the [ROLE SDK](https://github.com/rwth-acis/ROLE-SDK)
 yourself.
2. Follow the install instrutions in the corresponding repositories to build the las2peer services and ROLE widgets. The links to the repositories can be found above. Please have a look at the README-files and the wiki's of the repositories.
3. If everything was build and configured correctly just run ```sh setup.sh```. 
The script just copies the builds of the repositories cloned in step 1 into a separate folder.
The folder is called __myCAE__ and has the following structure:
 * __etc__ property files of the services
 * __lib__ the libraries for the cae backend services
 * __service__ the cae backend services
 * __frontend__
    * __cae__ the cae widgets
    * __syncmeta__ the syncmeta widgets
    * __wireframe__ the wireframing editor widget

Check the folder structure and make sure eveything is there and your urls are set correctly.


4. Run ```sh start``` to open the supervisor frontend at http://localhost:9001 in your standard browser. From here you can manually start the services you want to work with. 
The following programs should be available in the supervisor frontend:
* __role__ start the role service at http://127.0.0.1:8073.
* __services__ the las2peer network available at http://localhost:8080/.
* __services_debug__ the las2peer network available at http://localhost:8080/ in debug mode.
* __yjs__ the y-websockets-server at port 1234.
* __widgets__ the webserver to serve the widgets at http://127.0.0.1:8001.The _widgets_-program requires the http-server module. You can get it by just running ```npm install -g http-server```.

__Note__
Start either __services__ or __services_debug__, because they use the same port(See step 4 from above). They are both exactly the same with just one difference that you can attach the java remote debugger to debug the las2peer-services with Eclipse or IntelliJ.