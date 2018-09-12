#!/bin/bash

# This script read the list of publications in the database and prints an HTML 
# file that displays all the selected publications.
#
# PARAMS
#	$1: (int) selection criterion: categories=1, Type=2
#	$2: (string) filtering value. For example to select all General Knowledge literrature=GK 	
#
#
# OUTPUT
#	/tmp-html/display : a file that contains the generated HTML code 
#

echo "Begin" 