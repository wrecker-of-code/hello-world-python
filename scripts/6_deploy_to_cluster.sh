# az aks install-cli # if you don't have kubectl installed
set -e

echo "*Prerequisites:*"
echo " -) Step 1 - Login to Azure"
echo " -) Step 2 - Setup Registry"
echo " -) Step 3 - Push to Registry"
echo " -) Step 4 - Setup Permissions"
echo " -) Step 5 - Create Cluster"
echo ""

echo "Getting nodes and deploying container from registry to cluster..."
echo ""

echo ""
kubectl get nodes
echo ""
kubectl create -f ../k8s/deployment.yaml

echo ""
echo "Waiting for pods to start..."
sleep 10
echo ""

kubectl get services,deployments,pods
echo ""

echo "Take the EXTERNAL-IP of the service and open it in a browser to see the app running."

echo ""
echo "The app was SUCCESSFULLY DEPLOYED to the cluster!"
echo ""