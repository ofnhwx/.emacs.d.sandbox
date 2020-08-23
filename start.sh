#!/usr/bin/bash
emacs -q -l "$(dirname $0)/init.el" & disown
