#!/bin/bash
while getopts "k:s:r:" options
do
   case "$options" in
      k) aws_access_key_id="$OPTARG";;
      s) aws_secret_access_key="$OPTARG";;
      r) region="$OPTARG";;
   esac
done

export AWS_ACCESS_KEY_ID="$aws_access_key_id"
export AWS_SECRET_ACCESS_KEY="$aws_secret_access_key"
export AWS_DEFAULT_REGION="$region"

cd ./src

# terraform destroy
terraform init
terraform plan
terraform apply -auto-approve