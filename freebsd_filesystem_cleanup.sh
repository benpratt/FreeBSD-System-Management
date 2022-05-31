#/bin/sh

# Cleanup package files
pkg clean -ay

# Remove orphaned files
pkg autoremove -y

# Cleanup freebsd-update files
find /var/db/freebsd-update/files/ -mtime +30 -delete
