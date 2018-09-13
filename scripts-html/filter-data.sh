#!/bin/bash

# This script read the list of publications in the database and prints an HTML 
# file that displays all the selected publications.
#
# PARAMS
#	$1: (int) selection criterion: categories=4, Type=3
#	$2: (string) filtering value. For example to select all General Knowledge literrature=GK 	
#
#
# OUTPUT
#	/tmp-html/display : a file that contains the generated HTML code 
#

html_tmp="../tmp-html/filter"
:> $html_tmp
total="../tmp-html/total"
:> $total

data='../data/resources-csv/'
folder='data/resources/'

# Find number of resources
i=0

for file in $(ls $data); do

	file="$data$file"
	
	tail -n+2 "$file" | while read resource || [ -n "$resource" ];
	do
		criteria=$(echo $resource | cut -d\; -f$1)
		
		if [ "$criteria" == "$2" ]; then
			i=$(($i+1))
			echo $i	> $total 
		fi
	done
	
done 

i=$(cat $total)

echo "<div class=\"row\">" >> $html_tmp
echo "<div class=\"col-sm-3\"><span style=\"font-size:20px;\">Total resources </span> " >> $html_tmp
echo "<span class=\"badge\">$i</span></div>" >> $html_tmp
echo "<div class=\"col-sm-3\"><span style=\"font-size:20px;\">Selected resources </span> " >> $html_tmp
echo "<span id=\"selected\" class=\"badge\">$i</span></div>" >> $html_tmp
echo "</div>" >> $html_tmp

echo "<br/>" >> $html_tmp

for file in $(ls $data); do

	file="$data$file"
	
	tail -n+2 "$file" | while read resource || [ -n "$resource" ]; 
	do
		criteria=$(echo $resource | cut -d\; -f$1)
		
		##########################################
		#
		# We found a resource, add it to html
		#
		##########################################

		if [ "$criteria" = "$2" ]; then
			name=$(echo $resource | cut -d\; -f1)
			author=$(echo $resource | cut -d\; -f2)
			type=$(echo $resource | cut -d\; -f3)
			category=$(echo $resource | cut -d\; -f4)
			year=$(echo $resource | cut -d\; -f5)
			abstract=$(echo $resource | cut -d\; -f6)
			url=$(echo $resource | cut -d\; -f7)
			pdf=$(echo $resource | cut -d\; -f8)		
		fi
	done
done 

echo "$i resources found for $2"