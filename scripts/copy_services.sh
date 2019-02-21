createCAEFolderStructure()
{
	echo "=> Create the folder structure to deploy the CAE"
	mkdir myCAE/lib
	mkdir myCAE/service
	mkdir myCAE/etc
	echo "		 DONE"
}

if [ ! -d "myCAE" ]; then
  createCAEFolderStructure
else 
  rm -rf myCAE/lib
  rm -rf myCAE/service
  rm -rf myCAE/etc
  createCAEFolderStructure
fi

echo "DEPLOY LAS2PEER SERVICES"
echo "=> Copy files of the model persistence service"
persistence=CAE-Model-Persistence-Service

cp $persistence/service/*.jar myCAE/service
cp $persistence/lib/*.jar  myCAE/lib/
cp $persistence/etc/i5.las2peer.services.modelPersistenceService.ModelPersistenceService.properties myCAE/etc
cp $persistence/etc/i5.las2peer.webConnector.WebConnector.properties myCAE/etc
echo "		DONE"

echo "=> Copy file of the code generation service"
codegeneration=CAE-Code-Generation-Service

cp $codegeneration/service/*.jar myCAE/service
cp $codegeneration/lib/*.jar  myCAE/lib
cp $codegeneration/etc/i5.las2peer.services.codeGenerationService.CodeGenerationService.properties myCAE/etc
echo "		DONE"

