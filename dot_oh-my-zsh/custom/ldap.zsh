function ldap() {
  echo "Setting up LDAP tunnel to $1 on port 3389"
  skey $1
  ssh ec2-user@jumphost.$1.net -L 3389:ldap.$1.net:389
}
