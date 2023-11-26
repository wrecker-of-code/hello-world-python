# Description: Create a resource group and a container registry
set -e

echo "*Prerequisites:*"
echo " -) Step 1 - Login to Azure"
echo ""

read -p "NEW RESOURCE GROUP: " RESOURCE_GROUP_NAME
echo ""

REGISTRY_NAME="$RESOURCE_GROUP_NAME"acr

echo "Creating resource group $RESOURCE_GROUP_NAME and azure container registry $REGISTRY_NAME"
echo ""

OUTPUT1=$(az group create --location westeurope --name $RESOURCE_GROUP_NAME)
OUTPUT2=$(az acr create --resource-group $RESOURCE_GROUP_NAME --name $REGISTRY_NAME --sku Basic --admin-enabled)

echo "Resource group $RESOURCE_GROUP_NAME and azure container registry $REGISTRY_NAME CREATED SUCCESSFULLY!"
