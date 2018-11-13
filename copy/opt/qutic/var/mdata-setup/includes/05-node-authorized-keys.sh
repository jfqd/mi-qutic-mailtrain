#!/bin/bash
# Configure node ssh authorized_keys file if available via mdata

if mdata-get node_authorized_keys 1>/dev/null 2>&1; then
  home='/home/node'
  mkdir -p ${home}/.ssh
  echo "# This file is managed by mdata-get node_authorized_keys" \
    > ${home}/.ssh/authorized_keys
  mdata-get admin_authorized_keys >> ${home}/.ssh/authorized_keys
  chmod 0700 ${home}/.ssh
  chmod 0644 ${home}/.ssh/authorized_keys
  chown ruby:ruby ${home}/.ssh/authorized_keys
fi
