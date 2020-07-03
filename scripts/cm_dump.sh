#! /bin/bash
# dumps configmaps and secrets of a namespace into folder
cmdname=$(basename $0)
DEBUG=true # uncomment to switch on debug

usage()
{
    cat << USAGE >&2

Dumps configmaps and secrets of a namespace into folder

Usage:

    $cmdname  <tmpdir> <namespace>

    tmpdir: directory where the configmaps and secrets are dumped to. File will be tmpdir/cmname or tmpdir/secretname
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

RAWCMLIST=$(kubectl -n ${NAMESPACE} get cm -o json| jq '.items[].metadata.name'| tr '\n' ' ')
IFS=' ' read -r -a CMARRAY <<< "$RAWCMLIST"
RAWSECRETLIST=$(kubectl -n ${NAMESPACE} get secret -o json| jq '.items[].metadata.name'| tr '\n' ' ')
IFS=' ' read -r -a SECRETARRAY <<< "$RAWSECRETLIST"

if [ ${DEBUG} = "true" ]; then
  echo parameters:
  echo TMPDIR = ${TMPDIR}
  echo NAMESPACE = ${NAMESPACE}
  echo CMARRAY = ${CMARRAY[@]}
  echo SECRETARRAY = ${SECRETARRAY[@]}
fi

# create working_directory
mkdir -p ${TMPDIR}

# check if one of the cm already exists
for element in "${CMARRAY[@]}"
do
    element=$(sed -e 's/^"//' -e 's/"$//' <<<${element})
    if [ -f ${TMPDIR}/${element} ]; then
      echo Configmap ${element} already in ${TMPDIR} - not overwriting - Bye
      exit 1
    fi
done

# check if one of the secrets already exists
for element in "${SECRETARRAY[@]}"
do
    element=$(sed -e 's/^"//' -e 's/"$//' <<<${element})
    if [ -f ${TMPDIR}/${element} ]; then
      echo Secret ${element} already in ${TMPDIR} - not overwriting - Bye
      exit 1
    fi
done

#write cm into folder
echo Dump configmaps of ${NAMESPACE}
for element in "${CMARRAY[@]}"
do
  element=$(sed -e 's/^"//' -e 's/"$//' <<<${element})
  kubectl -n ${NAMESPACE} get cm/${element} -o yaml > ${TMPDIR}/${element}
done


#write secret into folder
echo Dump secrets of ${NAMESPACE}
for element in "${SECRETARRAY[@]}"
do
  element=$(sed -e 's/^"//' -e 's/"$//' <<<${element})
  kubectl -n ${NAMESPACE} get secret/${element} -o yaml > ${TMPDIR}/${element}
done
