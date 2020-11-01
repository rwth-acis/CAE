# CAE
The Community Application Editor

CAE Core Components:
* [CAE-Templates](https://github.com/rwth-acis/CAE-Templates)
* [CAE-Frontend](https://github.com/rwth-acis/CAE-Frontend)
* [CAE-Code-Generation-Service](https://github.com/rwth-acis/CAE-Code-Generation-Service)
* [CAE-Model-Persistence-Service](https://github.com/rwth-acis/CAE-Model-Persistence-Service)
* [CAE-Project-Management-Service](https://github.com/rwth-acis/CAE-Project-Management-Service)
* [CAE-Simple-Model-Representation](https://github.com/rwth-acis/CAE-Simple-Model-Representation)
* ~~[CAE-GitHub-Proxy](https://github.com/rwth-acis/CAE-GitHub-Proxy)~~ (deprecated)

CAE Tools and Apps
* [CAE-WireframingEditor](https://github.com/rwth-acis/CAE-WireframingEditor)
* [CAE-Jenkins](https://github.com/rwth-acis/cae-jenkins)
* [CAE-Deployment](https://github.com/rwth-acis/cae-deployment)
* [Syncmeta](https://github.com/rwth-acis/syncmeta)
* [CAE-Example-Application](https://github.com/rwth-acis/CAE-Example-Application)
* ~~[CAE-DockerImage](https://github.com/rwth-acis/CAE-DockerImage)~~(deprecated)
* ~~[CAE-LiveDeploy](https://github.com/rwth-acis/CAE-LiveDeploy)~~(deprecated)
* ~~[ROLE SDK](https://github.com/rwth-acis/ROLE-SDK)~~(deprecated)

[![Gitter](https://badges.gitter.im/rwth-acis/CAE.svg)](https://gitter.im/rwth-acis/CAE?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

<a href="https://las2peer.org/">
<img src="http://dbis.rwth-aachen.de/noracle/assets/las2peer.svg" alt="las2peer" style="width:420px;height:70px"/>
</a>

## Usage
CAE is currently deployed in the tech4comp cluster, you can access it with following address:

https://cae.tech4comp.dbis.rwth-aachen.de

If you want to run your own CAE instance, please continue to read.
If you are a developer and want to setup a development instance, please also have a look at the guide in the [wiki](https://github.com/rwth-acis/CAE/wiki/Setting-up-your-own-local-CAE-instance).

This repository contains Kubernetes configurations to deploy CAE. If you want to try it locally, it would be best to setup [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/). 

Initially, apply configurations under 'config', 'ingress' and 'volumes'. After, deployment and service configurations (backend.yaml, frontend.yml, jenkins.yml) are need to be applied.

All setup is tried to be parametrized with configmap and secrets. Therefore, you need to update files under `config` folder only according to your setup. If you see something to improve or change in other parts, feel free to open merge request.

Detailed explaination of the fields in the configmap and secrets can be found in the following section.

**Note**: Nginx ingress is used therefore it should be installed to Kubernetes cluster beforehand. `ingress-nginx.sh` can be used for this purpose. Also, if you are using `minikube` as Kubernetes cluster, you need to call `minikube addons enable ingress` command in order to enable Nginx ingress. 

**Note**: Deployment configurations have *kubernetes.io/role:master* as nodeSelector, therefore this label should be added to cluster nodes which CAE application is wanted to run on it. Label can be added to node with following command: `kubectl label nodes <node_name> kubernetes.io/role=master`

### Fields in configmap.yml
* `git_organization`: Github organization which holds the repositories of created components and applications.
* `git_organization_projects`: Github organization which holds Github projects of created CAE projects. Note: This might be the same as the organization used for the repositories.
* `jenkins_url`: Url of Jenkins instance which CAE application is using during deployment
* `jenkins_prefix`: Path prefix to all paths of Jenkins. Let's say Jenkins is running on `127.0.0.1:8080` and login page of Jenkins is accessed with `127.0.0.1:8080/login` address. If `/jenkins` value is provided as `jenkins_prefix`, login page will be accessed with `127.0.0.1:8080/jenkins/login` from now on.
* `widget_homebase_url`: Url of widget homebase. It should be github.io adress of Github organization of provided with `git_organization` value. If Github organization name is 'cae', `widget_homebase_url` need to be *https://cae.github.io*
* `temp_deployment_repo`: Git repo address to store project temporary during deployment
* `cae_deployment_docker_image`: Docker image which is used during deployment.
* `frontend_widgets_url`: Url address of where CAE widgets are served. Address of CAE-Frontend need to be given to this value.
* `yjs_server`: Root url address of Yjs websocket server. If it is running behind reverse proxy, relative path need to be provided with the following `yjs_resource_path` field.
* `yjs_resource_path`: Resource path of Yjs websocker server. If websocket server running behind reverse proxy and `/yjs` path is redirected to websocket server, this field need to be `/yjs/socket.io`
* `codegen_service_url`: Url address of Code Generation Service
* `code_editor_bower`: Url address of Bower components for Live Code Editor widget.
* `cae_backend_url`: Url address of CAE backend
* `cae_application_deployment_url`: Url address of deployed CAE application
* `oidc_client_id`: OIDC client id which used in CAE Frontend for authentication purpose. Client id can be acquired from Learning Layers after client registration
* `req_baz_project_id`: Id of a project in the [Requirements Bazaar](https://requirements-bazaar.org) which should be used for the categories that get created for every CAE component.

### Fields in secrets
**Attention**: All the values in the secrets need to be base64 encoded

#### Fields in secrets/github-creds.yml
* `username`: Username of Github account
* `password`: Password of Github account. Instead of using account password directly, it would be better create *API Token* under *Developer Setting* in Github. Created API Token can be provided as password value in here
* `personal_access_token`: This needs to be a personal access token of the Github account which is used to create new repositories for the CAE components.

#### Fields in secrets/github-creds-oauth-app.yml
* `oauth_clientid`: Client id of the Github OAuth app used for connecting users CAE and Github account to be able to create new cards in Github projects within the Github projects widget of the CAE.
* `oauth_clientsecret`: Client secret of the Github OAuth app used for connecting users CAE and Github account to be able to create new cards in Github projects within the Github projects widget of the CAE.
  
**Note**: For more information on the OAuth app see [rwth-acis/CAE-Project-Management-Service](https://github.com/rwth-acis/CAE-Project-Management-Service).

#### Fields in secrets/github-creds-projects.yml
* `personal_access_token`: This needs to be a personal access token of the Github account which is used to create new Github projects for CAE projects.

#### Fields in secrets/jenkins-job-token.yml
* `token`: Token which is used to trigger Jenkins job during deployment. It can be generated randomly. It should be in UUID format.

#### Fields in secrets/mysql-creds.yml
* `username`: Username of MySQL user
* `password`: Password of MySQL user

**Note**: There is a problem with using non-root db user currently, therefore please use root user in database. 
