if mdata-get mailtrain_mysqluser 1>/dev/null 2>&1; then
  MYSQLUSER=`mdata-get mailtrain_mysqluser`
  sed -i "s/user=\"mailtrain-user\"/user=\"${MYSQLUSER}\"/" /home/node/mailtrain/config/production.toml
fi

if mdata-get mailtrain_mysqlpassword 1>/dev/null 2>&1; then
  MYSQLPWD=`mdata-get mailtrain_mysqlpassword`
  sed -i "s/password=\"mailtrain-pwd\"/password=\"${MYSQLPWD}\"/" /home/node/mailtrain/config/production.toml
fi

if mdata-get mailtrain_mysqldbname 1>/dev/null 2>&1; then
  MYSQDB=`mdata-get mailtrain_mysqldbname`
  sed -i "s/database=\"mailtrain-db\"/database=\"${MYSQDB}\"/" /home/node/mailtrain/config/production.toml
fi

if mdata-get mailtrain_sender_processes 1>/dev/null 2>&1; then
  SENDER_PROCESSES=`mdata-get mailtrain_sender_processes`
  sed -i "s/processes=10/processes=${SENDER_PROCESSES}/" /home/node/mailtrain/config/production.toml
fi

SESSION_SECRET=`dd if=/dev/urandom bs=32 count=1 2>/dev/null | shasum -a 512 | awk '{print $1}' | tr -d '\n'`
sed -i "s/secret=\"a cat\"/secret=\"${SESSION_SECRET}\"/" /home/node/mailtrain/config/production.toml
svcadm enable svc:/application/mailtrain:default
