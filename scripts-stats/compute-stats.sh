#!/bin/bash

html='../tmp-html/stats'
:> $html

websites='../data/websites.csv'
nbWebsites=$(cat $websites | wc -l)
nbWebsites=$(($nbWebsites-1))

echo '<div class="col-sm-2">' >> $html
echo "<p class="stat-p"><span class="lettrine">$nbWebsites</span> Websites</p>" >> $html
echo '</div>' >> $html

echo '<div class="col-sm-1"></div>' >> $html

data='../data/resources-csv/'
total="../tmp-html/total"
:> $total

book="../tmp-html/book"
:> $book

article="../tmp-html/article"
:> $article

# Find number of resources
i=0
b=0
a=0
echo $i	> $total 
echo $b	> $book
echo $a	> $article

for file in $(ls $data); do

	file="$data$file"
	
	tail -n+2 "$file" | while read resource || [ -n "$resource" ];
	do
		i=$(($i+1))
		echo $i	> $total 		

		type=$(echo $resource | cut -d\; -f3)

		if [ "$type" = "Book" ]; then
			b=$(($b+1))
			echo $b	> $book			
		fi

		if [ "$type" = "Article" ]; then
			a=$(($a+1))
			echo $a	> $article			
		fi

	done
	
done

i=$(cat $total)

echo '<div class="col-sm-2">' >> $html
echo "<p class="stat-p"><span class="lettrine">$i</span> Resources</p>" >> $html
echo '</div>' >> $html

echo '<div class="col-sm-1"></div>' >> $html

b=$(cat $book)

echo '<div class="col-sm-2">' >> $html
echo "<p class="stat-p"><span class="lettrine">$b</span> Books</p>" >> $html
echo '</div>' >> $html

echo '<div class="col-sm-1"></div>' >> $html

a=$(cat $article)

echo '<div class="col-sm-2">' >> $html
echo "<p class="stat-p"><span class="lettrine">$a</span> Articles</p>" >> $html
echo '</div>' >> $html



rm $book
rm $article
rm $total