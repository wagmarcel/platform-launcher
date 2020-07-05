#! /bin/bash
# restores configmaps and secrets of a namespace taken from a folder
cmdname=$(basename $0)
#DEBUG=true # uncomment to switch on debug


# list deployments and sfs with their image tags
# parameters: <type>
# type: "deployment" or "statefulsets"
# return pairs of name,image_name
list_images()
{
  local TYPE=$1
  # dump deployment and StatefulSet
  local NAMES=($(kubectl -n oisp get ${TYPE} -o jsonpath={...spec.template.spec.containers[*].name}))
  local IMAGES=($(kubectl -n oisp get ${TYPE} -o jsonpath={...spec.template.spec.containers[*].image}))

  RETURNVAL=()
  for index in "${!NAMES[@]}";
  do
    RETURNVAL+=("${NAMES[$index]},${IMAGES[$index]}")
  done
  echo ${RETURNVAL[@]}
}


# check whether array and file are identical
# parameters: <array> <filename>
# array: array name of array which is compared
# filename: filename of file to be compared with array
# return "true" or "false"
check_equal()
{
  local -n ARRAY=$1
  local FILENAME=$2
  RET="true"
  index=0
  while read -r line; do
    if [ ! "$line" = "${ARRAY[$index]}" ]; then
      RET="false"
    fi
    (( index++ ))
  done < ${FILENAME}

  echo $RET
}

usage()
{
    cat << USAGE >&2

Dumps configmaps and secrets of a namespace into folder

Usage:

    $cmdname  <tmpdir>

    tmpdir: directory where the configmaps and secrets are dumped to. File will be tmpdir/cmname or tmpdir/secretname
USAGE
    exit 1
}

if [ "$#" -ne 1 ] || [ "$1" = "-h" ] ;
then
    usage
fi

TMPDIR=$1
K8SOBJECTS=($(ls ${TMPDIR}/*.yaml))

# first check whether the name,image pairs match
DEPLOYMENTS_COMP=($(list_images deployments | tr " " "\n" | sort | uniq))
SFS_COMP=($(list_images statefulsets | tr " " "\n" | sort | uniq))
RESULT1=$(check_equal DEPLOYMENTS_COMP ${TMPDIR}/deployments)
RESULT2=$(check_equal SFS_COMP ${TMPDIR}/statefulsets)

if [ "$RESULT1" = "false" ] || [ "$RESULT2" = "false" ]; then
  while true; do
      read -p "Mismatch detected between deployments and statefulsets. Be aware that this could affect the compatibility. Continue?" yn
      case $yn in
          [Yy]* ) break;;
          [Nn]* ) exit 1;;
          * ) echo "Please answer yes or no.";;
      esac
  done
fi

# debug output
if [ "${DEBUG}" = "true" ]; then
  echo main parameters:
  echo TMPDIR = ${TMPDIR}
  echo K8SOBJECTS = ${K8SOBJECTS[@]}
fi

# sanity check: If one of paramters is empty - stop
if [ "${#K8SOBJECTS[@]}" -eq 0 ]; then
  echo paramters not healthy. K8SOBJECTS is empty - Bye
  exit 1
fi

# check if one of the cm already exists
for element in "${K8SOBJECTS[@]}"
do
    kubectl apply -f $element
done
