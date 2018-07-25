#!/bin/sh
#
# BBF check script (loosely) based on the IETF one.

ietf_dir="standard/ietf"
bbf_dir="standard/bbf"

cwd=`pwd`

cd $bbf_dir
to_check=`find standard draft -mindepth 1 -maxdepth 1 -type d`
cd $cwd

pyang_flags="--strict --max-line-length=70 --lint --lint-modulename-prefix=bbf --lint-namespace-prefix=urn:bbf:yang: --verbose --path=$cwd/$ietf_dir --path=$cwd/$bbf_dir"

checkDir () {
    local dir="$bbf_dir/$1"
    echo Checking yang files in $dir
    exit_status=""
    printf "\n"
    for f in `find $dir -name '*.yang'`; do
	errors=`pyang $pyang_flags $f 2>&1 | grep "error:"`
	if [ ! -z "$errors" ]; then
	    echo Errors in $f
            printf "\n  $errors \n"
	    exit_status="failed!"
	fi
    done
    if [ ! -z "$exit_status" ]; then
	exit 1
    fi
}

echo Checking modules with pyang command:
printf "\n    pyang $pyang_flags MODULE\n\n"

for d in $to_check; do
    checkDir $d
done
