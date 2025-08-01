#!/bin/bash
# Commander-ShepardN7
# Gmail account credentials
username="user@gmail.com"
password="16-digit-password "
offset="   "  # Adjust the number of spaces for desired offset

curl -s -u "$username:$password" https://mail.google.com/mail/feed/atom/important | \
xmlstarlet sel -N a="http://purl.org/atom/ns#" -t -m "//a:entry" \
  -v "concat(a:author/a:name, ': ', a:title)" -n | \
head -n 8 | \
fold -s -w 35 | \
head -n 7 | \
sed "s/^/${offset}/"

