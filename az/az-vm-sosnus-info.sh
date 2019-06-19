echo "AZ SHOW SOSNUS-VM STATUS"
# az vm get-instance-view --name sosnus-vm --resource-group sosnus-vm --query instanceView.statuses[1] --output json

az vm get-instance-view --name sosnus-vm --resource-group sosnus-vm --query instanceView.statuses[1] --output table
#  | jq -r '.displayStatus'

echo "${b}"
# echo $b
# az vm get-instance-view --name sosnus-vm --resource-group sosnus-vm --query instanceView.statuses[1] --output table  
# az vm show -g sosnus-vm -n sosnus-vm
# ping 104.41.151.213

echo "AZ get IP address..."
az vm list-ip-addresses -n sosnus-vm -o table  

echo "RDP app: Win+R mstsc"
