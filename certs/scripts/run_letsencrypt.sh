for d in $DOMAINS
do
 echo "Running certbot for $d"
 certbot certonly --standalone --agree-tos -n --email $EMAIL -d $d
 ec=$?
 echo "certbot exit code $ec"
 if [ $ec -eq 0 ]
 then
  # For haproxy, you need to concatenate the full chain with the private key
  # cat /etc/letsencrypt/live/$d/fullchain.pem /etc/letsencrypt/live/$d/privkey.pem > /certs/$d.pem
  # For nginx or apache, you need both separate files
  cp /etc/letsencrypt/live/$d/fullchain.pem /certs/$d.pem
  cp /etc/letsencrypt/live/$d/privkey.pem /certs/$d.key
 fi
done
