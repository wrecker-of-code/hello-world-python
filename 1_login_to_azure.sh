# Description: Login to Azure
set -e

echo "Ok let's start with this!"
echo "First you have to login to Azure..."
echo ""

OUTPUT=$(az login --scope https://management.core.windows.net//.default)

echo "LOGIN SUCCESSFUL!"
echo ""