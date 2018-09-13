#!/bin/bash
html_tmp="../tmp-html/websites.html"
html="../websites.html"
name="Websites"

head='../tmp-html/head'
menu='../tmp-html/menu'
header='../tmp-html/header'

data='../data/websites.csv'
logos='data/website-logos/'

:>$html_tmp
:>$html

echo '<!DOCTYPE html>' >> $html_tmp
echo '<html>' >> $html_tmp

############################
#
# Genrate the html HEAD tag
#
############################
./head.sh "$name"
cat $head >> $html_tmp
echo ''>> $html_tmp

echo '<body>' >> $html_tmp

###########################
#
# Generate the navigation menu
#
###########################
./menu.sh
cat $menu >> $html_tmp
echo ''>> $html_tmp


##########################################
#
# Generate the content of websites.html page
#
##########################################
echo '<div class=container>' >> $html_tmp


########################################
#
# Generate the header and about section
#
########################################
./header.sh
cat $header >>  $html_tmp
echo ''>> $html_tmp



########################################
#
# Generate selection buttons
#
########################################
select="../tmp-html/selection"
./selection-row.sh
cat $select >>  $html_tmp
echo ''>> $html_tmp

# echo ' <div id="page-title" class="row title-row">' >> $html_tmp
# echo '  <div class="col-sm-4"></div>' >> $html_tmp
# echo '  <div class="col-sm-4 center-col"><h1>websites</h1></div>' >> $html_tmp
# echo '  <div class="col-sm-4"></div>' >> $html_tmp
# echo '</div>' >> $html_tmp

echo "" >> $html_tmp
echo "" >> $html_tmp
echo "" >> $html_tmp

###########################################
#
# List of websites
#
###########################################

nbwebsites=$(tail -n+2 $data | wc -l)

echo "<div class=\"row\">" >> $html_tmp
echo "<div class=\"col-sm-3\"><span style=\"font-size:20px;\">number of websites </span> " >> $html_tmp
echo "<span class=\"badge\">$nbwebsites</span></div>" >> $html_tmp
echo "<div class=\"col-sm-3\"><span style=\"font-size:20px;\">selected websites </span> " >> $html_tmp
echo "<span id=\"selected\" class=\"badge\">$nbwebsites</span></div>" >> $html_tmp
echo "</div>" >> $html_tmp

echo "<br/>" >> $html_tmp

echo "<div id=\"websites\">" >> $html_tmp

echo "<div class=\"row\">" >> $html_tmp

i=0

tail -n+2 $data | while read website 
do

		name=$(echo $website | cut -d\; -f1)
		url=$(echo $website | cut -d\; -f2)
		logo=$(echo $website | cut -d\; -f3)
		abstract=$(echo $website | cut -d\; -f4)

		echo "<div id=\"$name\" class=\"col-sm-3\">" >> $html_tmp

		echo "<a data-toggle=\"collapse\" href=\"#collapse$i\"><img src=\"$logos$logo\" width=\"200\" /></a>" >> $html_tmp

		echo " <h4><a data-toggle=\"collapse\" href=\"#collapse$i\">$name</a></h4>" >> $html_tmp

		echo " <div id=\"collapse$i\" class=\"collapse\">" >> $html_tmp

		echo "  <p>$abstract</p>" >> $html_tmp
		echo "  <a href=\"$url\" class=\"btn btn-pyta\">visit website</a>" >> $html_tmp
		
		echo ' </div>' >> $html_tmp

		echo '</div>' >> $html_tmp
		echo "" >> $html_tmp

		i=$(($i+1))
done

echo '</div>' >> $html_tmp

echo '</div>' >> $html_tmp

###########################################
#
# Close container
#
###########################################
echo '</div>' >> $html_tmp

echo '<br/>' >> $html_tmp
echo '<br/>' >> $html_tmp


#Close html and body
echo '</body>' >> $html_tmp
echo '</html>' >> $html_tmp


##########################################
#
# Copy the produced page into the main folder
#
##########################################
cp $html_tmp $html
echo "..$name.html page has been generated"

