#!/bin/bash

index_tmp='../tmp-html/index.html'
head='../tmp-html/head'
menu='../tmp-html/menu'

:> $index_tmp

echo '<!DOCTYPE html>' >> $index_tmp
echo '<html>' >> $index_tmp

#Genrate the html HEAD tag
./head.sh
cat $head >> $index_tmp
echo ''>> $index_tmp

echo '<body>' >> $index_tmp

#Generate the navigation menu
./menu.sh
cat $menu >> $index_tmp
echo ''>> $index_tmp

echo 'Azul Amadal' >> $index_tmp

echo '</body>' >> $index_tmp
echo '</html>' >> $index_tmp

#
#
#Copy the produced page into the main folder
index='../index.html'
cp $index_tmp $index

echo "...index.html page has been generated"