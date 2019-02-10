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

# svcadm enable svc:/application/mailtrain:default