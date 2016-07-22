#!/bin/bash
#i-562151ea
#52.58.203.113
public_ip="52.58.203.113"
instance_id="i-562151ea"
allocation_id="eipalloc-6613be0f"

#aws ec2 describe-addresses
echo "########Associating IP#########"
aws ec2 associate-address --instance-id $instance_id --allocation-id $allocation_id
sleep 2
oldip=$(aws ec2 describe-instances --instance-id $instance_id |grep "ASSOCIATION" | awk {'print $4'} |uniq)
sleep 2
echo "########Disassociating IP#########"
aws ec2 disassociate-address --public-ip $public_ip
sleep 2
newip=$(aws ec2 describe-instances --instance-id $instance_id |grep "ASSOCIATION" | awk {'print $4'} |uniq)

echo $oldip
echo $newip
