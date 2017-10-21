#cd CAE-Code-Generation-Service && ant jar
#cd ..
#cd CAE-Model-Persistence-Service && ant jar
#cd ..

echo "DEPLOY LAS2PEER SERVICES"
echo "=> Copy files of the model persistence service"
persistence=CAE-Model-Persistence-Service

scp $persistence/service/*.jar cae@cloud10.dbis.rwth-aachen.de:./services2/CAE-Server/service
scp $persistence/lib/*.jar  cae@cloud10.dbis.rwth-aachen.de:./services2/CAE-Server/lib
echo "		DONE"

echo "=> Copy file of the code generation service"
codegeneration=CAE-Code-Generation-Service

scp $codegeneration/service/*.jar cae@cloud10.dbis.rwth-aachen.de:./services2/CAE-Server/service
scp $codegeneration/lib/*.jar cae@cloud10.dbis.rwth-aachen.de:./services2/CAE-Server/lib
echo "		DONE"