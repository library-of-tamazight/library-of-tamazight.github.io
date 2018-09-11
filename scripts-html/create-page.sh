#!/bin/bash

# This script creates an html page (+ is .sh generator).
#
# FEATURES
# 	The sh script is executable
# 	It is added to ./generate-website.sh
#   The HTML page contains the menu of the website
#
# PARAMETER
#     $1: name
#
# OUTPUT 
#	name.sh
#	name.html
#


script="$1.sh"

:> $script

#########################################################################
#
# Initialize script
#
#########################################################################
echo "#!/bin/bash" >> $script

echo "html_tmp=\"../tmp-html/$1.html\"" >> $script
echo "html=\"../$1.html\"" >> $script
echo "" >> $script

echo "head='../tmp-html/head'" >> $script
echo "menu='../tmp-html/menu'" >> $script
echo "header='../tmp-html/header'" >> $script

echo "" >> $script
echo "" >> $script

echo ":>\$html_tmp" >> $script
echo ":>\$html" >> $script

echo "" >> $script
echo "" >> $script

echo "echo '<!DOCTYPE html>' >> \$html_tmp" >> $script
echo "echo '<html>' >> \$html_tmp" >> $script
echo "" >> $script

echo "############################" >> $script
echo "#" >> $script
echo "# Genrate the html HEAD tag" >> $script
echo "#" >> $script
echo "############################" >> $script
echo "./head.sh" >> $script
echo "cat \$head >> \$html_tmp" >> $script
echo "echo ''>> \$html_tmp" >> $script
echo "" >> $script
echo "echo '<body>' >> \$html_tmp" >> $script
echo "" >> $script

echo "###########################" >> $script
echo "#" >> $script
echo "# Generate the navigation menu" >> $script
echo "#" >> $script
echo "###########################" >> $script
echo "./menu.sh" >> $script
echo "cat \$menu >> \$html_tmp" >> $script
echo "echo ''>> \$html_tmp" >> $script
echo "" >> $script
echo "" >> $script

echo "##########################################" >> $script
echo "#" >> $script
echo "# Generate the content of $1.html page" >> $script
echo "#" >> $script
echo "##########################################" >> $script
echo "echo '<div class="container">' >> \$html_tmp" >> $script
echo "" >> $script
echo "" >> $script


echo "########################################" >> $script
echo "#" >> $script
echo "# Generate the header and about section" >> $script
echo "#" >> $script
echo "########################################" >> $script
echo "./header.sh" >> $script
echo "cat \$header >>  \$html_tmp" >> $script
echo "echo ''>> \$html_tmp" >> $script
echo "" >> $script
echo "" >> $script

echo "echo ' <div id=\"page-title\" class=\"row title-row\">' >> \$html_tmp" >> $script
echo "echo '  <div class=\"col-sm-4\"></div>' >> \$html_tmp" >> $script
echo "echo '  <div class=\"col-sm-4 center-col\"><h1>$1</h1></div>' >> \$html_tmp" >> $script
echo "echo '  <div class=\"col-sm-4\"></div>' >> \$html_tmp" >> $script
echo "echo '</div>' >> \$html_tmp" >> $script

echo "" >> $script
echo "" >> $script

echo "echo ' <div class=\"row\">' >> \$html_tmp" >> $script
echo "echo '  <div class=\"col-sm-5\"></div>' >> \$html_tmp" >> $script
echo "echo '   <div class=\"col-sm-2 center-col\">' >> \$html_tmp" >> $script
echo "echo \"    <img src=\\\"img/construction.png\\\" alt=\\\"under construction\\\" class=\\\"center-img\\\" width=\\\"200\\\" />\" >> \$html_tmp" >> $script
echo "echo '   </div>' >> \$html_tmp" >> $script
echo "echo '  <div class="col-sm-5"></div>' >> \$html_tmp" >> $script
echo "echo ' </div>' >> \$html_tmp" >> $script

echo "" >> $script
echo "" >> $script

echo "###########################################" >> $script
echo "#" >> $script
echo "# Close container" >> $script
echo "#" >> $script
echo "###########################################" >> $script
echo "echo '</div>' >> \$html_tmp" >> $script
echo "" >> $script
echo "" >> $script
echo "#Close html and body" >> $script
echo "echo '</body>' >> \$html_tmp" >> $script
echo "echo '</html>' >> \$html_tmp" >> $script
echo "" >> $script
echo "" >> $script

echo "##########################################" >> $script
echo "#" >> $script
echo "# Copy the produced page into the main folder" >> $script
echo "#" >> $script
echo "##########################################" >> $script
echo "cp \$html_tmp \$html" >> $script
echo "echo \"...\$html page has been generated\"" >> $script
echo "" >> $script

###################################################################
#
# Add this page script to the global generation script
#
###################################################################
chmod +x $script

echo "./$script" >> generate-website.sh