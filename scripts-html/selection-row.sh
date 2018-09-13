#!/bin/bash

html_tmp="../tmp-html/selection"
:> $html_tmp

echo '<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">' >> $html_tmp

echo '  <button type="button" id="A" onclick="test(this);" class="btn btn-secondary">A</button>' >> $html_tmp
echo '  <button type="button" id="B" class="btn btn-secondary">B</button>' >> $html_tmp
echo '  <button type="button" id="C" class="btn btn-secondary">C</button>' >> $html_tmp
echo '  <button type="button" id="D" class="btn btn-secondary">D</button>' >> $html_tmp
echo '  <button type="button" id="E" class="btn btn-secondary">E</button>' >> $html_tmp
echo '  <button type="button" id="F" class="btn btn-secondary">F</button>' >> $html_tmp

echo '  <button type="button" id="G" class="btn btn-secondary">G</button>' >> $html_tmp
echo '  <button type="button" id="H" class="btn btn-secondary">H</button>' >> $html_tmp
echo '  <button type="button" id="I" class="btn btn-secondary">I</button>' >> $html_tmp
echo '  <button type="button" id="J" class="btn btn-secondary">J</button>' >> $html_tmp
echo '  <button type="button" id="K" class="btn btn-secondary">K</button>' >> $html_tmp
echo '  <button type="button" id="L" class="btn btn-secondary">L</button>' >> $html_tmp

echo '  <button type="button" id="M" class="btn btn-secondary">M</button>' >> $html_tmp
echo '  <button type="button" id="N" class="btn btn-secondary">N</button>' >> $html_tmp
echo '  <button type="button" id="O" class="btn btn-secondary">O</button>' >> $html_tmp
echo '  <button type="button" id="P" class="btn btn-secondary">P</button>' >> $html_tmp
echo '  <button type="button" id="Q" class="btn btn-secondary">Q</button>' >> $html_tmp
echo '  <button type="button" id="R" class="btn btn-secondary">R</button>' >> $html_tmp

echo '  <button type="button" id="S" class="btn btn-secondary">S</button>' >> $html_tmp
echo '  <button type="button" id="T" class="btn btn-secondary">T</button>' >> $html_tmp
echo '  <button type="button" id="U" class="btn btn-secondary">U</button>' >> $html_tmp
echo '  <button type="button" id="V" class="btn btn-secondary">V</button>' >> $html_tmp
echo '  <button type="button" id="W" class="btn btn-secondary">W</button>' >> $html_tmp
echo '  <button type="button" id="X" class="btn btn-secondary">X</button>' >> $html_tmp

echo '  <button type="button" id="Y" class="btn btn-secondary">Y</button>' >> $html_tmp
echo '  <button type="button" id="Z" class="btn btn-secondary">Z</button>' >> $html_tmp

echo '</div>' >> $html_tmp

echo '<br/>' >> $html_tmp