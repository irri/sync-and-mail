# NEED TO SETUP MUTT FOR SENDING EMAILS TOO

cd /root/volvo/
source credentials.sh
mkdir -p tmp_mnt
mkdir -p to_sync
echo $PASSWORD | sshfs $USER@$HOST:$DIR tmp_mnt -o password_stdin -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
rsync -rutL -i tmp_mnt/ to_sync/ > new_items.txt
fusermount -u tmp_mnt
rmdir tmp_mnt
ITEMS=$(cat new_items.txt | egrep '^>' | cut -d ' ' -f2)
echo All new items: $ITEMS
for item in $ITEMS; do
  echo Mailing item $item
  mutt -s "[SexdregaServer] Nytt dokument på Volvofinans" -a to_sync/$item -- $MAILTO < mailtext.txt
done
