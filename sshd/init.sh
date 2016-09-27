#!/bin/bash
encrypted=`echo "${SSH_PASSWORD}" | openssl passwd -1 -stdin`
useradd ${SSH_USER} --home /home/${SSH_USER} --shell /bin/bash -p $encrypted -m

echo "User '${SSH_USER}' created with password '${SSH_PASSWORD}'"

# Ensure ssh host keys are present
/usr/bin/ssh-keygen -A

echo "${SSH_USER} ALL=(ALL) ALL" >> /etc/sudoers.d/${SSH_USER}
echo "Defaults !requiretty" >> /etc/sudoers.d/${SSH_USER}

/usr/sbin/sshd -D
