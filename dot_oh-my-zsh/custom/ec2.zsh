function ec2() {
  skey $1

  if [ "$3" != "" ]
  then
      ssh -J ec2-user@jumphost.$1.net $3@$2
  else
      ssh -J ec2-user@jumphost.$1.net centos@$2
  fi  
}
