#!/usr/bin/env bash

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

integer_check () {
    NAMING_ERROR="No, you don't want to use a name that contains something but numbers, it's not funny, believe me."
    if ! [[ $1 =~ ^[0-9]+$ ]]; then
	echo $NAMING_ERROR
	return 0
    fi
}

c_existence_check () {
    if [[ -d $1 ]]; then
	echo "Sorry, but this homework already exists."
	return 0
    fi
}

mr_existence_check () {
    if ! [[ -d $1 ]]; then
	echo "Sorry, but this one doesn't exist."
	return 0
    fi
}

if getopts 'c:r:' OPTION; then
    case $OPTION in
	c)
	    INDEX=$OPTARG
	    integer_check $INDEX
	    path=$DIR/$INDEX
	    c_existence_check $path
	    
	    mkdir $path
	    cp $DIR/template/* $path/
	    
	    echo "Created $INDEX!"
	    ;;
	r)
	    INDEX=$OPTARG
	    integer_check $INDEX
	    path=$DIR/$INDEX
	    mr_existence_check $path
	    
	    echo "Deleted $INDEX!"
	    return 0
	    ;;
	*)
	    "raar"
	    return 0
    esac
fi

cd $path
echo "Moved to $INDEX!"

