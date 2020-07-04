#! /bin/bash
# dumps configmaps and secrets of a namespace into folder
cmdname=$(basename $0)
#DEBUG=true # uncomment to switch on debug
REMOVEFIELDS=(creationTimestamp resourceVersion uid selfLink)

# filter out the EXCLUDED and remove '""'
# Parameters: <ARRAY> <EXCLUDED>
filter()
{
  local -n ARRAY=$1
  local -n EXCL=$2
  if [ "${DEBUG}" = "true" ]; then
    echo parameters of filter:
    echo ARRAY = ${ARRAY[@]}
    echo EXCLUDED = ${EXCL[@]}
  fi
  #remove '""'
  for index in ${!ARRAY[*]}; do
    ARRAY[$index]=$(sed -e 's/^"//' -e 's/"$//' <<<${ARRAY[$index]})
  done

  # remove excluded
  for del in ${EXCL[@]}; do
    for index in ${!ARRAY[*]}; do
      if [[ "${ARRAY[$index]}" =  $del* ]]; then
        unset ARRAY[$index]
      fi
    done
  done
}


# remote not needed fields from K8s objects
# such as creationTimestamp, resourceVersion, uid, selfLink
# parameters: <filename>
remove_fields()
{
  local FILENAME=$1
  local -n RMFLDS=$2

  if [ "${DEBUG}" = "true" ]; then
    echo parameters of remove_fields:
    echo FILENAME = ${FILENAME}
    echo RMFLDS = ${RMFLDS[@]}
  fi

  for field in ${RMFLDS[@]}; do
    sed -i "/$field/d" ${FILENAME}
  done

}


usage()
{
    cat << USAGE >&2

Dumps configmaps and secrets of a namespace into folder

Usage:

    $cmdname  <tmpdir> <namespace> <exclude>

    tmpdir: directory where the configmaps and secrets are dumped to. File will be tmpdir/cmname or tmpdir/secretname
    namespace: K8s namespace where db is located
    exclude: List of prefixes which should be excluded from backup, list is in quotes and seperated by space e.g "sh.helm dummy"
USAGE
    exit 1
}

if [ "$#" -ne 3 ] || [ "$1" = "-h" ] ;
then
    usage
fi

TMPDIR=$1
NAMESPACE=$2
EXCLUDED=($3)

RAWCMLIST=$(kubectl -n ${NAMESPACE} get cm -o json| jq '.items[].metadata.name'| tr '\n' ' ')
IFS=' ' read -r -a CMARRAY <<< "$RAWCMLIST"
RAWSECRETLIST=$(kubectl -n ${NAMESPACE} get secret -o json| jq '.items[].metadata.name'| tr '\n' ' ')
IFS=' ' read -r -a SECRETARRAY <<< "$RAWSECRETLIST"

filter CMARRAY EXCLUDED
filter SECRETARRAY EXCLUDED

# debug output
if [ "${DEBUG}" = "true" ]; then
  echo main parameters:
  echo TMPDIR = ${TMPDIR}
  echo NAMESPACE = ${NAMESPACE}
  echo EXLUDED = ${EXCLUDED[@]}
  echo CMARRAY = ${CMARRAY[@]}
  echo SECRETARRAY = ${SECRETARRAY[@]}
fi

# create working_directory
mkdir -p ${TMPDIR}

# check if one of the cm already exists
for element in "${CMARRAY[@]}"
do
    if [ -f ${TMPDIR}/${element} ]; then
      echo Configmap ${element} already in ${TMPDIR} - not overwriting - Bye
      exit 1
    fi
done

# check if one of the secrets already exists
for element in "${SECRETARRAY[@]}"
do
    if [ -f ${TMPDIR}/${element} ]; then
      echo Secret ${element} already in ${TMPDIR} - not overwriting - Bye
      exit 1
    fi
done

#write cm into folder
echo Dump configmaps of ${NAMESPACE}
for element in "${CMARRAY[@]}"
do
  kubectl -n ${NAMESPACE} get cm/${element} -o yaml > ${TMPDIR}/${element}.yaml
  remove_fields ${TMPDIR}/${element}.yaml REMOVEFIELDS
done


#write secret into folder
echo Dump secrets of ${NAMESPACE}
for element in "${SECRETARRAY[@]}"
do
  kubectl -n ${NAMESPACE} get secret/${element} -o yaml > ${TMPDIR}/${element}.yaml
  remove_fields ${TMPDIR}/${element}.yaml REMOVEFIELDS
done
