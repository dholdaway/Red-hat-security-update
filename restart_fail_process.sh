#!/bin/sh

# Process restarter only for Redhat
# By Darren Holdaway

# Safety feature: exit script if error is returned, or if variables not set.
# Exit if a pipeline results in an error.

set -ue
set -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"



ps auxw | grep  vivaldiframeworkd | grep -v grep > /dev/null

if [ $? != 0 ]
then
        /etc/init.d/vivaldiframeworkd start > /dev/null
fi