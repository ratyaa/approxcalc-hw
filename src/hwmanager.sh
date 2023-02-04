#!/usr/bin/env bash

NIXOS=1

OPTIND=1
SOURCE=${BASH_SOURCE[0]}
# resolve $SOURCE until the file is no longer a symlink
while [ -L "$SOURCE" ]; do
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

INDEX=template
path=$DIR/template
NC='\033[0m'
BRED='\033[1;31m'
BBLUE='\033[1;34m'
BYELLOW='\033[1;33m'

function integer_check() {
    if ! [[ $1 =~ ^[0-9]+$ ]]; then
	echo -e "${BYELLOW}No, you don't want to use a name that contains something but numbers, it's not funny, believe me.${NC}"
	return 1
    fi
    echo ""
}

function c_existence_check() {
    if [ -d $1 ]; then
	echo -e "${BYELLOW}Sorry, but this homework already exists.${NC}"
	return 1
    fi
    echo ""
}

function mr_existence_check() {
    if ! [ -d $1 ]; then
	echo -e "${BYELLOW}Sorry, but this one doesn't exist.${NC}"
	return 1
    fi
    echo ""
}
if getopts 'c:r:' OPTION; then
    case $OPTION in
	c)
	    INDEX=$OPTARG
	    intcheckv=$(integer_check $INDEX)
	    if ! [[ $intcheckv == "" ]]; then
		echo $intcheckv
		return 0
	    fi
	    path=$DIR/$INDEX
	    dircheckv=$(c_existence_check $path)
	    if ! [[ $dircheckv == "" ]]; then
		echo $dircheckv
		return 0
	    fi
	    
	    mkdir $path
	    cp -r $DIR/template/* $path/
	    echo $INDEX > $path/tex/index.tex
	    echo "$(date +'%d %B %Y г.')" > $path/tex/date.tex
	    
	    echo -e "${BBLUE}Successfully created hw/$INDEX.${NC}"
	    ;;
	r)
	    INDEX=$OPTARG
	    intcheckv=$(integer_check $INDEX)
	    if ! [[ $intcheckv == "" ]]; then
		echo $intcheckv
		return 0
	    fi
	    path=$DIR/$INDEX
	    dircheckv=$(mr_existence_check $path)
	    if ! [[ $dircheckv == "" ]]; then
		echo $dircheckv
		return 0
	    fi

	    if [[ -z $(git -C $DIR status --porcelain) ]]
	    then
		rm -r $path
		echo -e "${BBLUE}Successfully removed hw/$INDEX.${NC}"
	    else
		echo -e "${BRED}You can't use this option while having uncommitted changes.${NC}\n"
		cd $DIR
		git status
	    fi
	    
	    return 0
	    ;;
	*)
	    "raar"
	    return 0
    esac
else
    INDEX=$1
    path=$DIR/$INDEX
    dircheckv=$(mr_existence_check $path)
    if ! [[ $dircheckv == "" ]]; then
	echo $dircheckv
	return 0
    fi
fi

cd $path
echo "Moved to hw/$INDEX."

if [[ $NIXOS == 1 ]]; then
    if [ -z $IN_NIX_SHELL ]; then
	nix-shell $DIR
    fi
fi
