#!/bin/bash
# Get arguments
INSTANCE_TYPE=$1

IMAGE_ID="ami-05f0a758b1c9909d1"
AWS_KEY="ys-oregon2"
SUBNET_ID="subnet-3deb2844"
SG_ID="sg-0050bf02c2488921b"

# Launch instance & get informations
echo 'launch instance'
LAUNCH_INFO=$(aws ec2 run-instances --image-id $IMAGE_ID --count 1 --instance-type $INSTANCE_TYPE \
--key-name $AWS_KEY --subnet-id $SUBNET_ID --security-group-ids $SG_ID --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=ys-dcgmi2}]' --user-data settings2.sh )   


# # Terminate instance
# sleep 10
# echo 'terminate instance'
# TERMINATE_INFO=$(aws ec2 terminate-instances --instance-ids $INSTANCE_ID)
# echo $TERMINATE_INFO
