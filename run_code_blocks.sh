#!/bin/bash

# Check if input file is provided
if [ $# -eq 0 ]; then
  echo "Error: No input file provided."
  echo "Usage: $0 <markdown_file>"
  exit 1
fi

# Get the file name from the command line arguments
FILE=$1

# Check if the file exists
if [ ! -f "$FILE" ]; then
  echo "Error: file '$FILE' does not exist."
  exit 1
fi

# Function receives the file with code and the name of the language and runs this code
function run_code {
  local lang=$1
  local file=$2
  case $lang in
    sh) /bin/bash $file;;
    shell) /bin/bash $file;;
    bash) /bin/bash $file;;
    js) /usr/bin/env node $file;;
    ts) /usr/bin/env ts-node $file;;
    python) /usr/bin/env python3 $file;;
    php) /usr/bin/env php $file;;
    ruby) /usr/bin/env ruby $file;;
    perl) /usr/bin/env perl $file;;
    go) mv "$file" "$file.go" && /usr/bin/env go run "$file.go";;
    scala) mv "$file" "$file.scala" && /usr/bin/env scalac "$file.scala";;
    java) mv "$file" "$file.java" && /usr/bin/env javac "$file.java";;
    c++) mv "$file" "$file.cpp" && /usr/bin/env gcc "$file.cpp";;
    c) mv "$file" "$file.c" && /usr/bin/env gcc "$file.c";;
  esac
}

# Loop through each line in the file
while read line; do
  LINE_NUM=$((LINE_NUM + 1))

  # Check if the line starts with a code block opener ```
  if [[ "$line" =~ '```' ]]; then
    # If there is a language specified after the opener, extract it
    if [[ "$line" =~ (.*) ]]; then
      LANG=${BASH_REMATCH[1]#'```'}
    else
      LANG=""
    fi
    # Set the values of the first line of code
    START_LINE=$((LINE_NUM + 1))

    # Read the lines until the code block is closed
    while read line; do
      LINE_NUM=$((LINE_NUM + 1))
      if [[ "$line" =~ '```' ]]; then
        # Set the values of the last line of code
        END_LINE=$((LINE_NUM - 1))
        break
      fi
    done

    # Create a file with code content
    TEMP_FILE=$(mktemp)
    cat $FILE  | sed -n "${START_LINE},${END_LINE}p" > $TEMP_FILE

    # Get the number of leading whitespaces for the first line
    indent=$(head -n 1 "$TEMP_FILE" | awk '{ print index($0, $1) - 1 }')

    # Remove the same number of leading spaces from each line
    sed -i "s/^\s\{$indent\}//" $TEMP_FILE

    # Running the code based on the language
    run_code $LANG $TEMP_FILE

    # Remove the temporary file
    rm $TEMP_FILE*
  # Check if the line starts with a code block opener ~~~
  elif [[ "$line" =~ '~~~' ]]; then
    # If there is a language specified after the opener, extract it
    if [[ "$line" =~ (.*) ]]; then
      LANG=${BASH_REMATCH[1]#'~~~'}
    else
      LANG=""
    fi
    # Set the values of the first line of code
    START_LINE=$((LINE_NUM + 1))

    # Read the lines until the code block is closed
    while read line; do
      LINE_NUM=$((LINE_NUM + 1))
      if [[ "$line" =~ '~~~' ]]; then
        # Set the values of the last line of code
        END_LINE=$((LINE_NUM - 1))
        break
      fi
    done

    # Create a file with code content
    TEMP_FILE=$(mktemp)
    cat $FILE  | sed -n "${START_LINE},${END_LINE}p" > $TEMP_FILE

    # Get the number of leading whitespaces for the first line
    indent=$(head -n 1 "$TEMP_FILE" | awk '{ print index($0, $1) - 1 }')

    # Remove the same number of leading spaces from each line
    sed -i "s/^\s\{$indent\}//" $TEMP_FILE

    # Running the code based on the language
    run_code $LANG $TEMP_FILE

    # Remove the temporary file
    rm $TEMP_FILE*
  fi
done < "$FILE"
