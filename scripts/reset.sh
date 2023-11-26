# Description: Stop a Kubernetes cluster in Azure
set -e

echo "*DANGER:* This will delete the resource group and all resources in it."
echo ""

read -p "RESOURCE GROUP: " RESOURCE_GROUP_NAME
echo ""

az group delete --name $RESOURCE_GROUP_NAME --no-wait
echo ""

echo "The resource group $RESOURCE_GROUP_NAME should be deleted when the countdown timer ends..."
echo "Check with 'az group list'"
echo ""

count_down=120  # 2 minutes, should be enouth time to delete the resource group

while [ $count_down -gt 0 ]; do
    echo -ne "$count_down seconds remaining...\r"
    sleep 1
    ((count_down--))
done


