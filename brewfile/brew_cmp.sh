#!/bin/sh

brew leaves | # or alternative, brew list -1 |
xargs sh -c 'for x; do
  grep ~/.config/brewfile/Brewfile* -e "$x" > /dev/null || echo $x
done' # _ | tee brewmissing.txt
