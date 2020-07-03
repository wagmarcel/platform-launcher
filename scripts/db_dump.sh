#! /bin/bash
# dumps database to tmp directory
cmdname=$(basename $0)
DEBUG=true # uncomment to switch on debug
usage()
{
    cat << USAGE >&2

Dumps postgres database to temp directory

Usage:

    $cmdname  <tmpdir> <dbname> <username> <password> <hostname>

    tmpdir: directory where the database is dumped to. File will be tmpdir/database.sql
    dbname: name of the dbase
    username: DB username
    password: password for username
    hostname: DB host, e.g. postgres
USAGE
    exit 1
}

if [ "$#" -ne 1 ] || [ "$1" = "-h" ] ;
then
    usage
fi

TMPDIR=$1
DBNAME=$(kubectl -n oisp get cm/oisp-config -o jsonpath='{..postgres}'| jq ".dbname")
USERNAME=$(kubectl -n oisp get cm/oisp-config -o jsonpath='{..postgres}'| jq ".su_username")
PASSWORD=$(kubectl -n oisp get cm/oisp-config -o jsonpath='{..postgres}'| jq ".su_password")
HOSTNAME=$(kubectl -n oisp get cm/oisp-config -o jsonpath='{..postgres}'| jq ".hostname")

if [ ${DEBUG} = "true" ]; then
  echo parameters:
  echo TMPDIR = ${TMPDIR}
  echo DBNAME = ${DBNAME}
  echo USERNAME = ${USERNAME}
  echo PASSWORD = ${PASSWORD}
  echo HOSTNAME = ${HOSTNAME}
fi

# sanity check: If username is empty stop
if [ -z "${USERNAME}" ]; then
  echo USERNAME is empty - Bye
  exit 1
fi
# if directory exists, exit
if [ -d "${TMPDIR}" ]; then
  echo tmpdir alredy exists - Bye
  exit 1
fi
