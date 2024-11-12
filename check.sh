#!/bin/bash
#
# BBF check script (loosely) based on the IETF one.
#
# Invoke without arguments from the top level of a YangModels/yang checkout.
#
# Invoke with the -h option to see command-line options.

# remember the current directory
cwd=`pwd`

# process arguments
bbf_dir="$cwd/standard/bbf"
before_dir="$cwd/experimental"
ietf_dir="$cwd/standard/ietf"
after_dir=""
ieee_dir="$cwd/standard/ieee"
pyang="pyang"
debug=""
dryrun=""
while getopts "b:e:i:E:I:p:dnh" option; do
    case "$option" in
        b) bbf_dir="$OPTARG";;
        e) before_dir="$OPTARG";;
        i) ietf_dir="$OPTARG";;
        E) after_dir="$OPTARG";;
        I) ieee_dir="$OPTARG";;
        p) pyang="$OPTARG";;
        d) debug="true";;
        n) dryrun="true";;
        h|*) cat <<END
Usage: $0
       -b BBF-DIR    # BBF YANG directory (default "$bbf_dir")
       -e BEFORE-DIR # IETF experimental YANG directory (default "$before_dir")
       -i IETF-DIR   # IETF published YANG directory (default "$ietf_dir")
       -E AFTER-DIR  # IETF experimental YANG directory (default "$after_dir")
       -I IEEE-DIR   # IEEE YANG directory (default "$ieee_dir")
       -p PYANG      # pyang command (default "$pyang")
       -d            # whether to generate debug output (default NO)
       -n            # whether to perform a try run (default NO)
       -h            # output this help

Run pyang to check YANG files in BBF-DIR. The pyang path is set to BBF-DIR,
BEFORE-DIR, IETF-DIR, AFTER-DIR, IEEE-DIR, so IETF experimental YANG can be
searched before or after IETF published YANG (or both before and after).
END
             exit 0
             ;;
    esac
done

# step over options
shift $(($OPTIND - 1))

# process remaining command line arguments (backwards compatibility)
if [ -n "$1" ]; then
    echo "warning: should use -b to override BBF-DIR"
    bbf_dir="$1"
fi
if [ -n "$2" ]; then
    echo "warning: should use -i to override IETF-DIR"
    ietf_dir="$2"
fi
if [ -n "$3" ]; then
    echo "warning: should use -p to override PYANG"
    pyang="$3"
fi
if [ -n "$4" ]; then
    echo "warning: should use -d to set DEBUG"
    debug="$4"
fi

# BBF-DIR and IETF-DIR must exist
if [ ! -d "$bbf_dir" ]; then
    echo "$bbf_dir doesn't exist"
    exit 1
fi
if [ ! -d "$ietf_dir" ]; then
    echo "$ietf_dir doesn't exist"
    exit 1
fi

# get the BBF-DIR absolute path, and collect YANG to be processed
cd $bbf_dir
bbf_dir=`pwd`
paths="standard"
[ -d draft ] && paths+=" draft"
to_check=`find $paths -mindepth 1 -maxdepth 1 -type d`

# get the IETF-DIR absolute path
cd $cwd
cd $ietf_dir
ietf_dir=`pwd`

# return to the starting directory
cd $cwd

# form the pyang flags
pyang_flags="--max-line-length=70 --lint --lint-modulename-prefix=bbf --lint-namespace-prefix=urn:bbf:yang: --lint-ensure-hyphenated-name"

for dir in $bbf_dir $before_dir $ietf_dir $after_dir $ieee_dir; do
    if [ ! -r $dir ]; then
        2>&1 echo "warning: $dir doesn't exist"
    else
        pyang_flags+=" --path=$dir"
    fi
done

if [ -n "$debug" ]; then
    pyang_flags+=" --verbose"
fi

# helper function for checking YANG files in a directory
check_dir () {
    local dir="$bbf_dir/$1"
    printf "\n"
    echo Checking YANG files in $dir
    exit_status=""
    for f in `find $dir -name '*.yang'`; do
	if [ -n "$debug" ]; then
	    echo "Checking $f"
	fi
        if [ -n "$dryrun" ]; then
            echo "$pyang $pyang_flags"
        else
	    errors=`$pyang $pyang_flags $f 2>&1 | grep "error:"`
	    if [ -n "$errors" ]; then
	        echo "Errors in $f"
                printf "\n  $errors \n"
	        exit_status="failed!"
	    fi
        fi
    done
    if [ -n "$exit_status" ]; then
	exit 1
    fi
}

echo "Checking modules with pyang command:"
printf "\nPYTHONPATH=$PYTHONPATH $pyang $pyang_flags MODULE\n"

for d in $to_check; do
    check_dir "$d"
done
