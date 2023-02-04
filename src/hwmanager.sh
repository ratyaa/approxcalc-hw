#!/usr/bin/env bash

NIXOS=1
OPTIND=1

SOURCE=${BASH_SOURCE[0]}
# resolve $SOURCE until the file is no longer a symlink
while [ -L $SOURCE ]; do
    TARGET=$(readlink "$SOURCE")
    if [[ $TARGET == /* ]]; then
	SOURCE=$TARGET
    else
	DIR=$( dirname "$SOURCE" )
	# if $SOURCE was a relative symlink, we need to resolve it relative
	# to the path where the symlink file was located
	SOURCE=$DIR/$TARGET
    fi
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
INDEX=$(find $DIR -maxdepth 1 -type d -regex "$DIR/[0-9]*" -exec basename {} \; | sort -n | tail -1)
if [ -z $INDEX ]; then INDEX=0; fi
INDEX=$(($INDEX+1))


NC='\033[0m'
BRED='\033[1;31m'
BBLUE='\033[1;34m'
BYELLOW='\033[1;33m'

function usage() {
    echo -e "Usage: ${SOURCE/$DIR/.} [-r/-c <string>]"
    echo "-c -- create"
    echo "-r -- remove"
}

function create() {
    mkdir $DIR/$INDEX
    rsync -a --exclude='.build' --exclude='svg-inkscape' --exclude 'pic' $DIR/template/ $DIR/$INDEX
    echo $INDEX > $DIR/$INDEX/tex/index.tex
    echo "$(date +'%d %B %Y г.')" > $DIR/$INDEX/tex/date.tex
    echo "${BBLUE}Successfully created hw/$INDEX.${NC}"
}

function remove() {
    if [ $(is_exist $DIR/$INDEX) = false ]; then
	echo "${BYELLOW}Sorry, but this one doesn't exist.${NC}"
	return 0
    fi

    if ! [ -z "$(git -C $DIR status --porcelain)" ]; then
	echo "${BRED}You can't use this option while having uncommitted changes.${NC}\n"
	return 0
    fi
    rm -r $DIR/$INDEX
    echo "${BBLUE}Successfully removed hw/$INDEX.${NC}"
    return 0
}

function is_exist() {
    if [ -d $1 ]; then
	echo "true"; return 0
    fi
    echo "false"; return 0
}

usagep=true
createp=false
removep=false

if getopts ':cr:' OPTION; then
    case $OPTION in
	c)
	    createp=true
	    usagep=false
	    ;;
	r)
	    removep=true
	    usagep=false
	    INDEX=$OPTARG
	    ;;
    esac
fi

if [ $usagep = true ]; then
    usage
elif [ $removep = true ]; then
    echo -e $(remove)
elif [ $createp = true ]; then
    echo -e $(create)
fi
