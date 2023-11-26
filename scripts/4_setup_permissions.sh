# Description: Create a service principal and assign it to the ACR
set -e

echo "*Prerequisites:*"
echo " -) Step 1 - Login to Azure"
echo " -) Step 2 - Setup Registry"
echo " -) Step 3 - Push to Registry"
echo ""

read -p "RESOURCE GROUP: " RESOURCE_GROUP_NAME
echo ""

REGISTRY_NAME="$RESOURCE_GROUP_NAME"acr

CREDENTIALS=$(az ad sp create-for-rbac --skip-assignment)

APP_ID=$(echo $CREDENTIALS | jq -r .appId)
PASSWORD=$(echo $CREDENTIALS | jq -r .password)
ACR_ID=$(az acr show --name $REGISTRY_NAME --query "id" --output tsv)

echo ""
echo "APP_ID: $APP_ID"
echo "PASSWORD: $PASSWORD"
echo "ACR_ID: $ACR_ID"
echo ""

echo "Assigning permissions to ACR..."
echo ""

echo "Now run the following assignment:"
echo "az role assignment create --assignee $APP_ID --role Reader --scope $ACR_ID"

echo ""
