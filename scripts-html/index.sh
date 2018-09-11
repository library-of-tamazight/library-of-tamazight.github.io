#!/bin/bash

index_tmp='../tmp-html/index-tmp.html'
head='../tmp-html/head'
menu='../tmp-html/menu'
header='../tmp-html/header'

:> $index_tmp

echo '<!DOCTYPE html>' >> $index_tmp
echo '<html>' >> $index_tmp

#################################################
#
# Genrate the html HEAD tag
#
#################################################
./head.sh
cat $head >> $index_tmp
echo ''>> $index_tmp

echo '<body>' >> $index_tmp

#################################################
#
# Generate the navigation menu
#
#################################################
./menu.sh
cat $menu >> $index_tmp
echo ''>> $index_tmp

#################################################
#
# Generate the header and about section
#
#################################################
./header.sh
cat $header >> $index_tmp
echo ''>> $index_tmp

#################################################
#
# Generate the content of index.html page
#
#################################################
echo '<div class="container">' >> $index_tmp



#######################
#
# Categories
#
#######################
echo '<div id="categories" class="row title-row">' >> $index_tmp
	echo '<div class="col-sm-5"></div>' >> $index_tmp
	echo '<div class="col-sm-2"><h1>Categories</h1></div>' >> $index_tmp
	echo '<div class="col-sm-5"></div>' >> $index_tmp
echo '</div>' >> $index_tmp

echo '<br/>' >> $index_tmp

echo '<div class="row">' >> $index_tmp

	echo '<div class="col-sm-2"></div>' >> $index_tmp


  #Read the list of book types
  books='../data/book-category'

  i=0

  tail -n+2 $books | while read type 
  do 
  		

  		page=$(echo $type | cut -d, -f2)
		name=$(echo $type | cut -d, -f3)
		img=$(echo $type | cut -d, -f4)

		echo ' <div class="col-sm-2 center-col">' >> $index_tmp
		echo "  <a href=\"$page.html\">" >> $index_tmp
		echo "   <img src=\"img/$img\" alt=\"$name\" class=\"center-img\" width=\"200\" />" >> $index_tmp
		echo '  </a>' >> $index_tmp
		echo "  <a class=\"btn btn-pyta\" href=\"$page.html\">$name</a>" >> $index_tmp
		echo ' </div>' >> $index_tmp

		i=$(($i+1))
		
		if [ $(($i%4)) -eq "0" ]; then
			echo '</div>' >> $index_tmp
			echo '' >> $index_tmp
			echo '<br />' >> $index_tmp
			echo '' >> $index_tmp
			echo '<div class="row">' >> $index_tmp
			echo '<div class="col-sm-2"></div>' >> $index_tmp
		fi		

  done

echo '</div>' >> $index_tmp


echo '' >> $index_tmp
echo '' >> $index_tmp

#######################
#
# Types
#
#######################
echo '<br/>' >> $index_tmp
echo '<br/>' >> $index_tmp

echo '<div id="types" class="row title-row">' >> $index_tmp
	echo '<div class="col-sm-5"></div>' >> $index_tmp
	echo '<div class="col-sm-2"><h1>Types</h1></div>' >> $index_tmp
	echo '<div class="col-sm-5"></div>' >> $index_tmp
echo '</div>' >> $index_tmp

echo '<br/>' >> $index_tmp

echo '<div class="row">' >> $index_tmp
  echo '<div class="col-sm-2"></div>' >> $index_tmp

  #Read the list of book types
  books='../data/book-types'

  tail -n+2 $books | while read type 
  do 
  		page=$(echo $type | cut -d, -f2)
		name=$(echo $type | cut -d, -f1)
		img=$(echo $type | cut -d, -f3)

		echo '<div class="col-sm-2 center-col">' >> $index_tmp
		echo "<a href=\"$page.html\">" >> $index_tmp
		echo "<img src=\"img/$img\" alt=\"$name\" class=\"center-img\" width=\"200\" />" >> $index_tmp
		echo '</a>' >> $index_tmp
		echo "<a class=\"btn btn-lg btn-pyta\" href=\"$page.html\">$name</a>" >> $index_tmp
		echo '</div>' >> $index_tmp
  done

echo '</div>' >> $index_tmp

#######################
#
# Websites
#
#######################
echo '<br/>' >> $index_tmp
echo '<br/>' >> $index_tmp

echo '<div id="websites" class="row title-row">' >> $index_tmp
	echo '<div class="col-sm-5"></div>' >> $index_tmp
	echo '<div class="col-sm-2"><h1>Websites</h1></div>' >> $index_tmp
	echo '<div class="col-sm-5"></div>' >> $index_tmp
echo '</div>' >> $index_tmp

echo '<br/>' >> $index_tmp

echo '<div class="row">' >> $index_tmp
echo '<div class="col-sm-5"></div>' >> $index_tmp

echo '<div class="col-sm-2 center-col">' >> $index_tmp

echo "<a href=\"websites.html\">" >> $index_tmp
echo "<img src=\"img/web.png\" alt=\"websites\" class=\"center-img\" width=\"200\" />" >> $index_tmp
echo '</a>' >> $index_tmp
echo "<a class=\"btn btn-lg btn-pyta\" href=\"websites.html\">websites</a>" >> $index_tmp		

echo '</div>' >> $index_tmp

echo '<div class="col-sm-5"></div>' >> $index_tmp
echo '</div>' >> $index_tmp

#######################
#
# Statistics
#
#######################
echo '<br/>' >> $index_tmp
echo '<br/>' >> $index_tmp

echo '<div id="statistics" class="row title-row">' >> $index_tmp
	echo '<div class="col-sm-5"></div>' >> $index_tmp
	echo '<div class="col-sm-2"><h1>Statistics</h1></div>' >> $index_tmp
	echo '<div class="col-sm-5"></div>' >> $index_tmp
echo '</div>' >> $index_tmp

echo ' <div class="row">' >> $index_tmp
echo '  <div class="col-sm-5"></div>' >> $index_tmp
echo '   <div class="col-sm-2 center-col">' >> $index_tmp
echo "    <img src=\"img/construction.png\" alt=\"under construction\" class=\"center-img\" width=\"200\" />" >> $index_tmp
echo '   </div>' >> $index_tmp
echo '  <div class="col-sm-5"></div>' >> $index_tmp
echo ' </div>' >> $index_tmp


#######################
#
# send us a resource
#
#######################
echo '<br/>' >> $index_tmp
echo '<br/>' >> $index_tmp

echo ' <div id="submit" class="row title-row">' >> $index_tmp
echo '  <div class="col-sm-4"></div>' >> $index_tmp
echo '  <div class="col-sm-4 center-col"><h1>Send resources</h1></div>' >> $index_tmp
echo '  <div class="col-sm-4"></div>' >> $index_tmp
echo ' </div>' >> $index_tmp


./send-resources.sh
resources='../tmp-html/send-resources'
cat $resources >> $index_tmp


#################################################
#
# Close container
#
#################################################
echo '</div>' >> $index_tmp


#Close html and body
echo '</body>' >> $index_tmp
echo '</html>' >> $index_tmp

#################################################
#
# Copy the produced page into the main folder
#
#################################################
index='../index.html'
cp $index_tmp $index
echo "...index.html page has been generated"