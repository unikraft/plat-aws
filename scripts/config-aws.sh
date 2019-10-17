#!/usr/bin/env bash
# "deploy-unikraft-aws.sh" script needs all the environmrntal variables mentioned
# below to be set correctly. Any unset value or incorrect value will cause the
# script to halt.
set -e
# Default Regions
REGION=eu-central-1

# Print the usage to the user
function usage () {
   echo "usage: $0 -r <region> "
   echo ""
   echo "<region>: The AWS EC2 region (default: ${REGION})"

}

# Process the arguments
while getopts "hr:" opt; do
 case $opt in
 h) usage;;
 r) REGION=$OPTARG ;;
 \?) echo "Invalid/No option -${OPTARG}" >&2
    usage && exit 1
 esac
done
shift $((OPTIND-1))

#echo Setting EC2 Environment...
# AWS Access Key Id
export AWS_ACCESS_KEY=''
# AWS Secret Key Id
export AWS_SECRET_KEY=''
# EC2 AMI Tool home path needed by commands
export EC2_AMITOOL_HOME=''
# EC2 API Tools home path needed by commands
export EC2_HOME=''
# AWS certificate file (abc.pem)
export EC2_CERT=''
# AWS private key (xyz.pem)
export EC2_PRIVATE_KEY=''
# AWS Account User Id
export EC2_USER=''
# Export the PATH
export PATH=$EC2_HOME/bin:$EC2_AMITOOL_HOME/bin:$PATH

echo Configuration Done.
