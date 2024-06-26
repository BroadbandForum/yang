#!/bin/sh
#
# BBF check script (loosely) based on the IETF one.
#
# Invoke without arguments in a YangModels/yang checkout
#
# Or specifying the pyang version and enabling debug output
#
# PYTHONPATH=$MYROOT/pyang/default standard/bbf/check.sh '' '' $MYROOT/pyang/default/bin/pyang true

cwd=`pwd`

# experimental YANG
exp_dir="$cwd/experimental"

# default arguments
bbf_dir="$cwd/standard/bbf"
ietf_dir="$cwd/standard/ietf"
ieee_dir="$cwd/standard/ieee"
pyang=pyang

# $1 overrides bbf_dir
if [ -n "$1" ]; then
  bbf_dir="$1"
fi

# $2 overrides ietf_dir
if [ -n "$2" ]; then
  ietf_dir="$2"
fi

# $3 overrides pyang (may also need to set PYTHONPATH)
if [ -n "$3" ]; then
  pyang="$3"
fi

# $4 if non-empty enables debug output
debug="$4"

# ieee_dir can't currently be overridden

cd $bbf_dir
to_check=`find standard draft -mindepth 1 -maxdepth 1 -type d`
bbf_dir=`pwd`

cd $ietf_dir
ietf_dir=`pwd`

cd $cwd

pyang_flags="--max-line-length=70 --lint --lint-modulename-prefix=bbf --lint-namespace-prefix=urn:bbf:yang: --lint-ensure-hyphenated-name --verbose --path=$bbf_dir --path=$exp_dir --path=$ietf_dir --path=$ieee_dir"

checkDir () {
    local dir="$bbf_dir/$1"
    printf "\n"
    echo Checking YANG files in $dir
    exit_status=""
    for f in `find $dir -name '*.yang'`; do
	if [ -n "$debug" ]; then
	    echo Checking $f
	fi
	errors=`$pyang $pyang_flags $f 2>&1 | grep "error:"`
	if [ -n "$errors" ]; then
	    echo Errors in $f
            printf "\n  $errors \n"
	    exit_status="failed!"
	fi
    done
    if [ -n "$exit_status" ]; then
	exit 1
    fi
}

echo Checking modules with pyang command:
printf "\nPYTHONPATH=$PYTHONPATH $pyang $pyang_flags MODULE\n"

for d in $to_check; do
    checkDir $d
done
