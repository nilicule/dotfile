function skey() {
  ssh-add -D
  ssh-add ~/.ssh/id_rsa
  ssh-add ~/.ssh/$1.pem
}
