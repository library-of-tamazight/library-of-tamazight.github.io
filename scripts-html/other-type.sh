#!/bin/bash
html_tmp="../tmp-html/other-type.html"
html="../other-type.html"
name="Other"

head='../tmp-html/head'
menu='../tmp-html/menu'
header='../tmp-html/header'


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
# Generate the content of other-type.html page
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

########################################
#
# Generate resources
#
########################################
filter="../tmp-html/filter"
./filter-data.sh 3 Other
cat $filter >>  $html_tmp


###########################################
#
# Close container
#
###########################################
echo '</div>' >> $html_tmp


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

