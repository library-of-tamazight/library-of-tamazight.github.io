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
echo $i	> $total 

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

echo "" >> $html_tmp
echo "<div id=\"resources\">" >> $html_tmp
echo " <div class=\"row\">" >> $html_tmp

j=0

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

			echo "" >> $html_tmp
			echo "  <div class=\"col-sm-3 resource\">" >> $html_tmp

			echo '            <div class="panel-group">' >> $html_tmp

			echo '                <div class="panel panel-pyta">' >> $html_tmp

			echo '                    <div class="panel-heading">' >> $html_tmp
			echo '                        <h4 class="panel-title"><a data-toggle="collapse" href="#collapse'$j'"><span class="name">'$name'</span></a></h4>' >> $html_tmp
			echo '                    </div>' >> $html_tmp

			echo '                    <div id="collapse'$j'" class="panel-collapse collapse">' >> $html_tmp

			echo '                        <div class="panel-body">' >> $html_tmp


			echo '                              <p>' >> $html_tmp
			echo '<span class="author">'$author'</span>. <span class="type">'$type'</span>. <span class="year">'$year'</span>.' >> $html_tmp
			echo '                              </p>' >> $html_tmp

			echo '                              <p>' >> $html_tmp
			echo $abstract >> $html_tmp
			echo '                              </p>' >> $html_tmp

			if [ ! "$pdf" = "none" ]; then
				echo "   <a href=\"$folder$pdf\" class=\"btn btn-pyta\">PDF</a>" >> $html_tmp
			fi

			if [ ! "$url" = "none" ]; then
				echo "   <a href=\"$url\" class=\"btn btn-pyta\">Link</a>" >> $html_tmp
			fi
			
			echo '                       </div>' >> $html_tmp
			echo '                  </div>' >> $html_tmp

			echo '               </div>' >> $html_tmp

			echo '           </div>' >> $html_tmp
	

			# echo "   <img src=\"img/book-icon.png\" alt=\"Book icon\" width=\"200\"/>" >> $html_tmp
			
			echo "  </div>" >> $html_tmp
			echo "" >> $html_tmp

			j=$(($j+1))

			if [ $(($j%4)) -eq "0" ]; then
				echo '</div>' >> $html_tmp
				echo '' >> $html_tmp
				echo '<br />' >> $html_tmp
				echo '' >> $html_tmp
				echo '<div class="row">' >> $html_tmp
			fi

		fi
	done
done 

echo " </div>" >> $html_tmp
echo "</div>" >> $html_tmp

echo "$i resources found for $2"