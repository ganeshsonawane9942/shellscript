#!/bin/bash
sudo apt-get update;
which kubectl;
if [ $? -eq 0 ] 
        then echo "installed"
else
        sudo apt-get install kubectl -y;
fi
which helm;
if [ $? -eq 0 ] 
        then
            echo "installed"
        else
            curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
fi
which gcloud;
if [ $? -eq 0 ]
        then
            echo "installed"
        else
            echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
            sudo apt-get install apt-transport-https ca-certificates gnupg -y 
            curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
            sudo apt-get update && sudo apt-get install google-cloud-sdk -y
fi
