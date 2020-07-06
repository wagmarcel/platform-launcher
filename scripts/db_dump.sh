#! /bin/bash
# dumps database to tmp directory
cmdname=$(basename $0)
#DEBUG=true # uncomment to switch on debug
DUMPFILE=database.sql
CONTAINER=oisp-stolon-keeper-0

usage()
{
    cat << USAGE >&2

Dumps postgres database to temp directory

Usage:

    $cmdname  <tmpdir> <namespace>

    tmpdir: directory where the database is dumped to. File will be tmpdir/database.sql
    namespace: K8s namespace where db is located
USAGE
    exit 1
}

if [ "$#" -ne 2 ] || [ "$1" = "-h" ] ;
then
    usage
fi

TMPDIR=$1
NAMESPACE=$2
DBNAME=$(kubectl -n oisp get cm/oisp-config -o jsonpath='{..postgres}'| jq ".dbname")
USERNAME=$(kubectl -n oisp get cm/oisp-config -o jsonpath='{..postgres}'| jq ".su_username")
PASSWORD=$(kubectl -n oisp get cm/oisp-config -o jsonpath='{..postgres}'| jq ".su_password")
HOSTNAME=$(kubectl -n oisp get cm/oisp-config -o jsonpath='{..postgres}'| jq ".hostname")

if [ "${DEBUG}" = "true" ]; then
  echo parameters:
  echo TMPDIR = ${TMPDIR}
  echo NAMESPACE = ${NAMESPACE}
  echo DBNAME = ${DBNAME}
  echo USERNAME = ${USERNAME}
  echo PASSWORD = ${PASSWORD}
  echo HOSTNAME = ${HOSTNAME}
fi

# sanity check: If one of paramters is empty - stop
if [ -z "${USERNAME}" ] || [ -z "${DBNAME}" ] || [ -z "${PASSWORD}" ] || [ -z "${HOSTNAME}" ]; then
  echo paramters not healthy. Some are empty - Bye
  exit 1
fi
# create dir
mkdir -p ${TMPDIR}
# if file exists, exit
if [ -f "${TMPDIR}/${DUMPFILE}" ]; then
  echo file alredy exists - will not overwriet - Bye
  exit 1
fi

echo Dump database
kubectl -n ${NAMESPACE} exec ${CONTAINER} -- /bin/bash -c "export PGPASSWORD=${PASSWORD}; pg_dump -U ${USERNAME} ${DBNAME} -h ${HOSTNAME} -F c -b " > ${TMPDIR}/${DUMPFILE}
