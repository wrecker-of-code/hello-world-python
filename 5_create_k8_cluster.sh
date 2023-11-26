# Description: Create a Kubernetes cluster in Azure
set -e

echo "*Prerequisites:*"
echo " -) Step 1 - Login to Azure"
echo " -) Step 2 - Setup Registry"
echo " -) Step 3 - Push to Registry"
echo " -) Step 4 - Setup Permissions"
echo ""

echo "*WARNING:* If this process does not succeed (probably a non-parsable password), do Step 4 again and try this step again."
echo ""

read -p "RESOURCE GROUP: " RESOURCE_GROUP_NAME
read -p "APP ID: " APP_ID
read -p "PASSWORD: " PASSWORD
echo ""

CLUSTER_NAME="$RESOURCE_GROUP_NAME"cluster

echo "Creating AKS cluster $CLUSTER_NAME with configurations - This process may take a while..."

az aks create --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP_NAME --node-count 1 --generate-ssh-keys --service-principal $APP_ID --client-secret $PASSWORD

az aks get-credentials --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP_NAME --file ~/.kube/config --overwrite-existing

echo ""
echo "AKS cluster $CLUSTER_NAME CREATED SUCCESSFULLY!"
echo ""

