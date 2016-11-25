#!/bin/sh

email=conlindurbin@gmail.com
tarsnap_output_filename=/tmp/tarsnap-output-temporary.log

# Run backup
tarsnap -vc \
	-f "$(uname -n)-$(date +%Y-%m-%d_%H-%M-%S)" \
  $(cat ~/.backuprc | sed "s:~:$HOME:") >$tarsnap_output_filename 2>&1

# Send email
if [ $? -eq 0 ]; then
	subject="Tarsnap backup success"
else
	subject="Tarsnap backup FAILURE"
fi
mail -s "$subject" $email < $tarsnap_output_filename
rm $tarsnap_output_filename
