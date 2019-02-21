createFolderStructure(){
	echo "=> Create folder structure for the frontend"
	mkdir myCAE/frontend
	mkdir myCAE/frontend/syncmeta
	mkdir myCAE/frontend/cae
	mkdir myCAE/frontend/wireframe
}

if [ ! -d "myCAE" ]; then
	mkdir myCAE
	createFolderStructure
else
	rm -rf myCAE/frontend/syncmeta
	rm -rf myCAE/frontend/cae
	rm -rf myCAE/frontend/wireframe
	rm -rf myCAE/frontend
	createFolderStructure
fi

echo "COPY Syncmeta build"
cp -R syncmeta/html/**  myCAE/frontend/syncmeta

echo "		DONE"
echo "COPY CAE-Frontend widgets"
cp -R CAE-Frontend/widgets/dist/** myCAE/frontend/cae
echo "		DONE"
echo "COPY CAE Wireframe editor widget"
cp -R CAE-WireframingEditor/widget/** myCAE/frontend/wireframe
echo "		DONE"
