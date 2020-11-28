#!/bin/bash

# CREATE NEW WEBAPP AND DEPLOY WITH IMAGE FROM MY (EXISTING) ACR REPOSITORY
appName=kruszyna99
MyResourceGroup=rg-smartemulator
MyPlan=asp-sinope
MyUniqueAppName=$appName
MyImageName=sosnuscontainers.azurecr.io/$appName
username=sosnuscontainers
password=eFD246f69y37qxQbHQD8lZt=5xNupgTW
echo CMD az webapp create -g $MyResourceGroup -p $MyPlan -n $MyUniqueAppName -i $MyImageName -s $username -w $password
az webapp create -g $MyResourceGroup -p $MyPlan -n $MyUniqueAppName -i $MyImageName -s $username -w $password

