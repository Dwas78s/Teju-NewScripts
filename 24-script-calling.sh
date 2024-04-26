#!/bin/bash
COURSE="Devops"
echo "Variable from current script: $COURSE"
echo "Process instance Id of current script:$$"

./ 25-script2-calling.sh

echo "Variable from currentscript: $COURSE"
