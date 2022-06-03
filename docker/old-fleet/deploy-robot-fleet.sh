#!/bin/bash
# StringVal="raptor1 raptor2 agv01 agv02 agv03 turtle01 turtle02 turtle03 turtle04 turtle05 kruszyna puszek okruch"

    ContainerName=smartemulator
    MyResourceGroup=rg-smartemulator
    MyPlan=asp-zethus
    username=sosnuscontainers
    password=<<<HIDE>>>
    ACR_NAME=sosnuscontainers
# Iterate the string variable using for loop
for val in $StringVal; do
    echo "----------------"
    appName=$val
    # code cfg
    figlet $val
    sed -i "s/PLACEHOLDER/${appName}/g" robotmetadata.py
    sed -i  "s/    coordLocal = .*/    coordLocal = False/g" robotmetadata.py
    
    if [[ $val == *"turtle"* ]]; then
        sed -i  "s/    coordLocal = .*/    coordLocal = True/g" robotmetadata.py
        # echo "TRUE!!!!!"
    fi    
    if [[ $val == *"agv"* ]]; then
        sed -i  "s/    coordLocal = .*/    coordLocal = True/g" robotmetadata.py
        # echo "TRUE!!!!!"
    fi
    cat robotmetadata.py
    # Azure build
    echo az acr build --registry $ACR_NAME --image $ContainerName:$appName .
    az acr build --registry $ACR_NAME --image $ContainerName:$appName .
    # Azure deploy
    echo $appName
    MyUniqueAppName=$appName
    MyImageName=$ACR_NAME.azurecr.io/$ContainerName:$appName
    echo az webapp create -g $MyResourceGroup -p $MyPlan -n $MyUniqueAppName -i $MyImageName -s $username -w $password
    az webapp create -g $MyResourceGroup -p $MyPlan -n $MyUniqueAppName -i $MyImageName -s $username -w $password
    ###az webapp delete --name $MyUniqueAppName --resource-group $MyResourceGroup
    sed -i "s/${appName}/PLACEHOLDER/g" robotmetadata.py


done

echo "BUILD, PUSH, DEPLOY, RUN - DONE"


