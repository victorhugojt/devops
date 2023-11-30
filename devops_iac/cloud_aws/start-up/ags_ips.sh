ips=""
ids=""
ASG="frontend_host_auto_scaling_group"
REGION="us-west-1"
while [ "$ids" = "" ]; do
  ids=$(aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names $ASG --region $REGION)
  sleep 1
done
for ID in $ids;
do
    IP=$(aws ec2 describe-instances --instance-ids $ID --region $REGION --query Reservations[].Instances[].PrivateIpAddress --output text)
    ips="$ips,$IP"
done