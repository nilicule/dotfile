function sshclean() {
  if [ -z "$1" ]; then
    echo "Example: sshclean <ip address>"
  else
    sed -i "" "/$1/d" ~/.ssh/known_hosts
  fi
}
