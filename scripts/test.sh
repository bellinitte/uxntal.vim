#!/usr/bin/env bash

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
DIM='\033[2m'
CLEAR='\033[0m'

function usage {
    echo "Usage: $0 <FILES...> [-b | --bless] [-h | --help]"
}

function transform {
    vim --clean -es \
        +'syntax on' \
        +'set syntax=none' `# Reset any auto-detected syntaxes e.g conf` \
        +"source $(dirname "$0")/highlights.vim" `# Ensure all spans are exported as defined in the syntax` \
        +"source $(dirname "$0")/../syntax/uxntal.vim" \
        +'run! syntax/2html.vim' \
        +'%print' \
        +'qa!' \
        /dev/stdin \
    | awk -f "$(dirname "$0")/extract.awk" \
    | python3 "$(dirname "$0")/transpose.py"
}

input_files=()

while test $# != 0
do
    case $1 in
    -b|--bless) bless=t;;
    -h|--help)  usage; exit 0;;
    *)          input_files+=("$1");;
    esac
    shift
done

tests_count=0
failed_count=0

for file in "${input_files[@]}"; do
    if [ ! -f "$file" ]; then
        continue
    fi

    if [[ $bless ]]; then
        echo -e "${YELLOW}!${CLEAR} Blessing snapshot for $file"
        transform < "$file" > "$file.snap"
        rm -f "$file.snap.new"
        continue
    fi

    if [ ! -f "$file.snap" ]; then
        echo -e "${YELLOW}!${CLEAR} No $file.snap to compare to. Run \`$0 $file --bless\` to generate it"
        continue
    fi

    snap="$(transform < "$file")"
    status=0
    diff=$(echo "$snap" | diff "$file.snap" -) || status=$?

    if [ $status -ne 0 ]; then
        echo -e "${RED}X${CLEAR} Test $file failed"
        echo -e "${DIM}$diff${CLEAR}"
        echo "$snap" > "$file.snap.new"
        ((failed_count++))
    else
        echo -e "${GREEN}✓${CLEAR} Test $file passed"
        rm -f "$file.snap.new"
    fi

    ((tests_count++))
done

if [[ $failed_count != 0 ]]; then
    echo "$failed_count/$tests_count tests failed"
elif [ ! "$bless" ]; then
    echo "All tests passed"
fi
