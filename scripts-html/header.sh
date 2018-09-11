#!/bin/bash

header='../tmp-html/header'
:> $header

echo '' >> $header

echo '  <div class="page-header">' >> $header
echo '   <div class="jumbotron">' >> $header
echo '    <div class="container">' >> $header
echo '      <div class="row">' >> $header
echo '        <div class="col-sm-3">' >> $header
echo '             <img src="img/library.png" class="center-img" width="200" alt="Library of Tamazight"/>' >> $header
echo '        </div>' >> $header
echo '            ' >> $header
echo '            <div class="col-sm-8">' >> $header
echo '              <div class="row">' >> $header
echo '                <div class="col-sm-12">' >> $header
echo '                    <h2 class="left-h2">The project</h2>' >> $header
echo '                    <p class="left-p">' >> $header
echo '                        Library of Tamazight (Tamkaṛḍit n Tmaziɣt) is a website that gathers scientific, artistic and cultural publications, books and websites that are related to the Berber culture.' >> $header 
echo '                        Our goal is to help people to find the books to read or the websites to visit in order to learn the culture, the languages and the history of Berber.' >> $header
echo '                    </p>' >> $header
echo '                  </div>                ' >> $header
echo '        </div>        ' >> $header
echo '          <div class="row">' >> $header
echo '                <div class="col-sm-3">' >> $header
echo '                    <a href="index.html#submit" class="btn btn-lg btn-pyta">Help us !</a>' >> $header
echo '                </div>' >> $header
echo '            </div>' >> $header
echo '          </div>' >> $header
echo '        </div>  ' >> $header
echo '      </div>' >> $header
echo '   </div>' >> $header
echo '  </div>' >> $header

echo '' >> $header
