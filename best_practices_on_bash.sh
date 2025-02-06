#!/usr/bin/env bash
# The env shebang allows your bash scripts to reliably run across different operating systems.
# By dynamically searching the PATH, you avoid hardcoding assumptions about the bash's location.

# Strict Bash Mode

set -o xtrace  # prints a trace of executed commands (i.e. set -x)
set -o nounset # abort on unbound variable (i.e. set -u)
echo ${NOT_EXISTING_VAR}
set -o errexit   # abort on nonzero exitstatus (i.e. set -e)
ls /file/that/doesnt/exist
set -o pipefail  # don't hide errors within pipes
ls /file/that/doesnt/exist | sort

# for short
set -euo pipefail

# End Strict Bash Mode

# Variables
test="test"
test1="oops"
test2=test1

echo $test        # test
echo $test1       # oops
echo "$test"1     # test1
echo '$test1'     # $test1
echo "'$test1'"   # 'oops'
echo "$test1"     # oops
echo "${test}1"   # test1
echo "${!test2}"  # oops

# End Variables

# For Range Loops
List="one two three"

for a in $List     # Splits the variable in parts at whitespace.
do
  echo "$a" # one
            # two
            # three
done

for a in "$List"     # Splits the variable in parts at whitespace.
do
  echo "$a" # one two three
done

# End For Range Loops

# Lists

names=(
  "Aaron Maxwell"
  "Wayne Gretzky"
  "David Beckham"
  "Anderson da Silva"
)

for name in ${names[@]}; do
  echo "$name"
done


IFS=$'\n' # Internal Field Separator - controls what Bash calls word splitting
for name in ${names[@]}; do
  echo "$name"
done
# End Lists


# Change directories inside scripts

# avoid
cd /tmp
echo "hello" > file
cd ..

# use
(
  cd ${DIR}
  echo "hello" > file
)

# or
pushd "${DIR}"
  echo "hello" > file
popd

# End Change directories inside scripts


# Functions

greet() {
  local name=$1
  local alias=$2
  echo "Hello ${name} also known as ${alias}"
}

greet Andre CEO
greet Anca Scrum Master
greet "Joao" "Chicken Master"


func1()
{
    ret_val=hi
}

func2()
{
    ret_val=bye
}

func3()
{
    local ret_val=nothing
    echo $ret_val
    func1
    echo $ret_val
    func2
    echo $ret_val
}

func3

# End Functions

# Gotchas

do_something ()
{
  echo "This function does something with \"$1\"."
}

do_something=do_something

do_something do_something

# All this is legal, but highly confusing.

hello() {
    str=$1
    echo "${str}"
}

a=50
hello =$a
hello = $a
# Assignment should be with '=' without spaces around
# Otherwise script tries to run "hello" command with '=50' as argument


# Fork bomb
:(){ :|:& };:

# End Gotchas
