function plex() {
  echo "Copying $1 to server"
  scp -r $1 flow@rc6.org:~/.plexupload/new/

  # Escape filename
  printf -v filename "%q" "$1"

  echo "Processing $filename on server"
  ssh flow@rc6.org "cd ~/.plexupload/new && ~/bin/rtorrent-scp $filename"
}
