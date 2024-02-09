function aws_assume() {
  awsume $@
  export AWS_ACCOUNT_NAME=$1
}
