#! /bin/bash
# restores configmaps and secrets of a namespace taken from a folder
cmdname=$(basename $0)
DEBUG=true # uncomment to switch on debug

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
    echo processing object $element
    kubectl apply -f $element
done
