#!/usr/bin/env bash

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
DIM='\033[2m'
CLEAR='\033[0m'

function usage {
    printf "Usage: $0 <FILES...> [-b | --bless] [-h | --help]\n"
}

function transform {
    vim --clean -es \
        +'syntax on' \
        +'set syntax=none' `# Reset any auto-detected syntaxes e.g conf` \
        +"source $(dirname $0)/highlights.vim" `# Ensure all spans are exported as defined in the syntax` \
        +"source $(dirname $0)/../syntax/uxntal.vim" \
        +'run! syntax/2html.vim' \
        +'%print' \
        +'qa!' \
        /dev/stdin \
    | awk -f $(dirname $0)/extract.awk \
    | python3 $(dirname $0)/transpose.py
}

input_files=()

while test $# != 0
do
    case $1 in
    -b|--bless) bless=t;;
    -h|--help)  usage; exit 0;;
    *)          input_files+=($1);;
    esac
    shift
done

tests_count=0
failed_count=0

for file in ${input_files[@]}; do
    if [ ! -f $file ]; then
        continue
    fi

    if [[ $bless ]]; then
        printf "${YELLOW}!${CLEAR} Blessing snapshot for $file\n"
        cat $file | transform > $file.snap
        rm -f $file.snap.new
        continue
    fi

    if [ ! -f $file.snap ]; then
        printf "${YELLOW}!${CLEAR} No $file.snap to compare to. Run \`$0 $file --bless\` to generate it\n"
        continue
    fi

    snap="$(cat $file | transform)"
    status=0
    diff=$(echo "$snap" | diff $file.snap -) || status=$?

    if [ $status -ne 0 ]; then
        printf "${RED}X${CLEAR} Test $file failed\n"
        printf "${DIM}"
        echo "$diff"
        printf "${CLEAR}"
        echo "$snap" > $file.snap.new
        ((failed_count++))
    else
        printf "${GREEN}✓${CLEAR} Test $file passed\n"
        rm -f $file.snap.new
    fi

    ((tests_count++))
done

if [[ $failed_count != 0 ]]; then
    printf "$failed_count/$tests_count tests failed\n"
elif [ ! $bless ]; then
    printf "All tests passed\n"
fi
