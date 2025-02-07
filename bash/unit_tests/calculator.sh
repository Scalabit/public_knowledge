#!/usr/bin/env bash

add () {
    local num1=$1
    local num2=$2
    let "res = ${num1} + ${num2}"
    echo $res
}