#! /bin/bash
# restore database
cmdname=$(basename $0)
DEBUG=true # uncomment to switch on debug
DUMPFILE=database.sql
CONTAINER=oisp-stolon-keeper-0


# read fields from oisp-config (what is the problem? the 3rd level objects are saved as string and, thus, tough to parse as JSON)
# parameters: <filename> <field>
read_postgres_oisp_config(){
  local FILENAME=$1
  local FIELD=$2

  # hmmm
  # get the json string,
  # remove outer quotes,
  # let echo interprete the \n,
  # replace \"
  # then parse with jq, replace outer quotes
  echo -e $(jq ".data.postgres" ${FILENAME} | sed 's/^"\(.*\)"$/\1/g') | sed 's/\\"/"/g' | jq ".${FIELD}" | sed 's/^"\(.*\)"$/\1/g'
}


usage()
{
    cat << USAGE >&2

Dumps postgres database to temp directory

Usage:

    $cmdname  <tmpdir> <namespace>

    tmpdir: directory where the database.sql and oisp-config can be found
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

# retrieve new passwords
echo set new passwords
OISPCONFIG=($(ls ${TMPDIR}/oisp-config.json))
# sanity test. This file musst exist in a sane backup
if [ ! -f "${OISPCONFIG}" ]; then
  echo oisp-config.json not found in db backup. Bye!
  exit 1;
fi
NEW_USERPASSWORD=$(read_postgres_oisp_config ${OISPCONFIG} password)
NEW_SUPERPASSWORD=$(read_postgres_oisp_config ${OISPCONFIG} su_password)
# sanity check: If one of paramters is empty - stop
if [ -z "${NEW_USERPASSWORD}" ] || [ -z "$[NEW_SUPERPASSWORD]" ]; then
  echo NEW_PASSWORDS are empty - Bye
  exit 1
fi

echo "ALTER USER oisp_user WITH PASSWORD '${NEW_USERPASSWORD}';" | kubectl -n ${NAMESPACE} exec -i ${CONTAINER} -- /bin/bash -c "export PGPASSWORD=${PASSWORD}; psql -U ${USERNAME}  -d ${DBNAME} -h ${HOSTNAME}"
echo "ALTER USER superuser WITH PASSWORD '${NEW_SUPERPASSWORD}';" | kubectl -n ${NAMESPACE} exec -i ${CONTAINER} -- /bin/bash -c "export PGPASSWORD=${PASSWORD}; psql -U ${USERNAME}  -d ${DBNAME} -h ${HOSTNAME}"

echo restore database
kubectl -n ${NAMESPACE} exec -i ${CONTAINER} -- /bin/bash -c "export PGPASSWORD=${NEW_SUPERPASSWORD}; pg_restore -c -U ${USERNAME}  -d ${DBNAME} -h ${HOSTNAME}" < ${TMPDIR}/${DUMPFILE}

echo set user rights
# retrieve new passwords and users
