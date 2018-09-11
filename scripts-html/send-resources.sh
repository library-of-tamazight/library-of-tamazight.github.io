#!/bin/bash

header='../tmp-html/send-resources'
:> $header

echo '' >> $header

echo '  <div class="page-header">' >> $header
echo '   <div class="jumbotron">' >> $header
echo '    <div class="container">' >> $header
echo '      <div class="row">' >> $header

echo '' >> $header

echo '        <div class="col-sm-3">' >> $header
echo '				<img src="img/library.png" class="center-img" width="200" alt="Library of Tamazight"/>' >> $header
echo '				<br/>' >> $header
echo '             <img src="img/submit.png" class="center-img" width="200" alt="Library of Tamazight"/>' >> $header
echo '        </div>' >> $header

echo '' >> $header
echo '            <div class="col-sm-9">' >> $header

echo '                    <h2 class="left-h2">Help us !</h2>' >> $header
echo '                    <p class="left-p">' >> $header
echo '                        Library of Tamazight (Tamkaṛḍit n Tmaziɣt) is an open-source project. We invite all interested people to help us to enrich our content and grow up our database.' >> $header
echo '                    </p>' >> $header 

echo '                    <h2 class="left-h2">How to help</h2>' >> $header

echo '                    <p>' >> $header 
echo '                        You have a thesis, article, website or a book related to Berber ? you can send it to us. We would be happy to add it to our database. Hereinafter, we give a list of interesting information about you resource:' >> $header
echo '                    </p>' >> $header

echo '					  <ul>' >> $header
echo '					  	<li>Name or title</li>' >> $header
echo '					  	<li>Year of publication</li>' >> $header
echo '					  	<li>Small paragraph of description (English, French or Taqbaylit languages are preferred)</li>' >> $header
echo '					  	<li>Url (for websites)</li>' >> $header
echo '					  	<li>List of authors (using this shape: Mohand Ummeri, Massin Harun, ...)</li>' >> $header
echo '					  	<li>Type of resource: website, book, thesis, article</li>' >> $header
echo '					  	<li>Category: Teaching, general knowledge, Children literature, Poetry, Scientific publication, History, Dictionary or Other</li>' >> $header
echo '					  	<li>A pdf or word file (if you want to share the resource)</li>' >> $header
echo '					  </ul>' >> $header

echo '                    <h2 class="left-h2">Last step</h2>' >> $header

echo '                    <p>' >> $header 
echo '                        Send you information to our e-mail address: tamkardit@gmail.com' >> $header
echo '                    </p>' >> $header

echo '            </div>' >> $header

echo '' >> $header

echo '        </div>  ' >> $header
echo '      </div>' >> $header
echo '   </div>' >> $header
echo '  </div>' >> $header

echo '' >> $header
