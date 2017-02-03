#!/bin/sh

set -e

BRANCH=$(git branch | sed -n '/\* /s///p')
git branch --set-upstream-to=origin/$BRANCH $BRANCH
