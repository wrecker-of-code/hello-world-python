# Description: Builds and Pushes the image to the Azure Container Registry
set -e

echo "*Prerequisites:*"
echo " -) Step 1 - Login to Azure"
echo " -) Step 2 - Setup Registry"
echo ""

echo "*WARNING:* Docker Desktop should be running already."
echo ""

read -p "RESOURCE GROUP: " RESOURCE_GROUP_NAME
echo ""

REGISTRY_NAME="$RESOURCE_GROUP_NAME"acr
IMAGE_NAME1="hello-world-python"

OUTPUT1=$(az acr login --name $REGISTRY_NAME --expose-token)
ACCESS_TOKEN=$(echo $OUTPUT1 | jq -r .accessToken)

docker login $REGISTRY_NAME.azurecr.io --username 00000000-0000-0000-0000-000000000000 --password $ACCESS_TOKEN
echo ""
echo "Building and Pushing docker image $IMAGE_NAME1 to private ACR $REGISTRY_NAME ..."
echo ""

docker build -t $REGISTRY_NAME.azurecr.io/$IMAGE_NAME1:latest .
echo ""
docker push $REGISTRY_NAME.azurecr.io/$IMAGE_NAME1:latest

echo ""
az acr repository list --name $REGISTRY_NAME --output table
echo ""

echo "The image $IMAGE_NAME1 was SUCCESSFULLY PUSHED to the private ACR $REGISTRY_NAME!"
