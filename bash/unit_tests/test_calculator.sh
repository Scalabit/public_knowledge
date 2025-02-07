#!/usr/bin/env bash

source calculator.sh

result=$(add 2 3)

let expected=5
[ "${result}" == "${expected}" ] || (echo "Assertion failed: ${result} != ${expected}"; exit 1)

let expected=10
[ "${result}" == "${expected}" ] || (echo "Assertion failed: ${result} != ${expected}"; exit 1)