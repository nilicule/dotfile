function ecp() {
  skey $1

  if [ "$4" != "" ]
  then
      scp -r -o "ProxyJump ec2-user@jumphost.$1.net" $2 $4@$3:~/
  else
      scp -r -o "ProxyJump ec2-user@jumphost.$1.net" $2 centos@$3:~/
  fi
}

