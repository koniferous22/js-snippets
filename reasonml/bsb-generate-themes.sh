#!/bin/sh
# Assumes already ran `npm i -g bs-platform`
bsb -themes | tail -n +2 | while read -r line; do bsb -init $line -theme $line; done
