function jump() {
  skey $1
  ssh ec2-user@jumphost.$1.net
}
