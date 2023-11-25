REGISTRY_NAME="piiv5wkacr"
IMAGE_NAME1="hello-world-python"

az login --scope https://management.core.windows.net//.default
az acr login --name $REGISTRY_NAME

docker build -t $REGISTRY_NAME.azurecr.io/$IMAGE_NAME1:latest .
docker push $REGISTRY_NAME.azurecr.io/$IMAGE_NAME1:latest
