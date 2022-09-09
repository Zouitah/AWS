#!/bin/bash

#echo -n "Infra Name : "
INFRA_NAME=$1

cp -r TEMPLATE DEPLOYED/${INFRA_NAME}
cd DEPLOYED/${INFRA_NAME}
touch temp_ip

sed -i "s|<##INFRA_NAME##>|${INFRA_NAME}|g" *

terraform init
terraform apply -auto-approve

cat << EOF
############################################################
############################################################
########                                           #########
########                                           #########
########    Web App Available at : $(cat temp_ip)   #########
########                                           #########
########                                           #########
############################################################
############################################################
EOF

rm temp_ip
exit
