#! /bin/bash
# restore database
cmdname=$(basename $0)
DEBUG=true # uncomment to switch on debug
DUMPFILE=database.sql
CONTAINER=oisp-stolon-keeper-0

usage()
{
    cat << USAGE >&2

Dumps postgres database to temp directory

Usage:

    $cmdname  <tmpdir> <namespace>

    tmpdir: directory where the database.sql can be found
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

if [ ${DEBUG} = "true" ]; then
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
  echo USERNAME is empty - Bye
  exit 1
fi

# if file does not exists, exit
if [ ! -f "${TMPDIR}/${DUMPFILE}" ]; then
  echo ${DUMPFILE} does not exists - Bye
  exit 1
fi

echo restore database
kubectl -n ${NAMESPACE} exec -i ${CONTAINER} -- /bin/bash -c "export PGPASSWORD=${PASSWORD}; psql -U ${USERNAME}  -d ${DBNAME} -h ${HOSTNAME}" < ${TMPDIR}/${DUMPFILE}
