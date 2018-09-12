#!/bin/bash

menu='../tmp-html/menu'
:> $menu

echo '' >> $menu

echo '   <nav class="navbar navbar-inverse navbar-fixed-top">' >> $menu
echo '     <div class="container">' >> $menu
echo '       <div class="navbar-header">' >> $menu
echo '         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">' >> $menu
echo '           <span class="sr-only">Toggle navigation</span>' >> $menu
echo '           <span class="icon-bar"></span>' >> $menu
echo '           <span class="icon-bar"></span>' >> $menu
echo '           <span class="icon-bar"></span>' >> $menu
echo '         </button>' >> $menu
echo '         <a class="navbar-brand" href="index.html">Library of Tamaziɣt</a>' >> $menu
echo '       </div>' >> $menu
echo '       <div id="navbar" class="collapse navbar-collapse">' >> $menu
echo '         <ul class="nav navbar-nav">' >> $menu
echo '           <li><a href="index.html">Home</a></li>' >> $menu
echo '           <li><a href="index.html#project">The project</a></li>' >> $menu

############################
#
# Print book-categories
#
###########################
echo '' >> $menu
echo '           <li class="dropdown">' >> $menu
 echo '           <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories <b class="caret"></b></a>' >> $menu
  echo '           <ul class="dropdown-menu">' >> $menu


  #Read the list of book categories
  books='../data/book-category.csv'

  tail -n+2 $books | while read category 
  do 
  		page=$(echo $category | cut -d, -f2)
		name=$(echo $category | cut -d, -f3)
		echo "         		<li><a href=\"$page.html\">$name</a></li>" >> $menu
  done

echo '            </ul>' >> $menu
echo '           </li>' >> $menu


############################
#
# Print book-types
#
###########################
echo '' >> $menu
echo '           <li class="dropdown">' >> $menu
 echo '           <a href="#" class="dropdown-toggle" data-toggle="dropdown">Types <b class="caret"></b></a>' >> $menu
  echo '           <ul class="dropdown-menu">' >> $menu


  #Read the list of book types
  books='../data/book-types.csv'

  tail -n+2 $books | while read type 
  do 
  		page=$(echo $type | cut -d, -f2)
		name=$(echo $type | cut -d, -f1)
		echo "         		<li><a href=\"$page.html\">$name</a></li>" >> $menu
  done

echo '            </ul>' >> $menu
echo '           </li>' >> $menu



echo '           <li><a href="index.html#websites">Websites</a></li>' >> $menu
echo '           <li><a href="index.html#statistics">Statistics</a></li>' >> $menu
echo '           <li><a href="index.html#submit">Send resources</a></li>' >> $menu
echo '           <li><a href="index-kab.html"><img src="img/kab.png" width="25" alt="Taqbaylit"/></a></li>' >> $menu
echo '           <li class="active"><a href="index.html"><img src="img/uk.png" width="25" alt="English"/></a></li>' >> $menu
echo '         </ul>' >> $menu
echo '       </div><!--/.nav-collapse -->' >> $menu
echo '     </div>' >> $menu
echo '   </nav>' >> $menu