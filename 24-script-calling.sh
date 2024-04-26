#!/bin/bash
COURSE="Devops"
echo "Variable from current script: $COURSE"
echo "Process instance Id of current script:$$"

./25-scriptother-calling.sh

echo "Variable from currentscript is : $COURSE"
