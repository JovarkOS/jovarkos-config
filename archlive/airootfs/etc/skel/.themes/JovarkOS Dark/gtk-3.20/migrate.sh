#!/bin/bash

mkdir -p export

for line in `gresource list gtk.gresource`
do gresource extract gtk.gresource $line > export$line;
done
