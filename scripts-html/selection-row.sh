#!/bin/bash

html_tmp="../tmp-html/selection"
:> $html_tmp

echo '<div id="selection-buttons" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">' >> $html_tmp

echo '  <button type="button" id="All" onclick="selectAll(this);" class="btn btn-secondary">All</button>' >> $html_tmp
echo '  <button type="button" id="A" onclick="select(this);" class="btn btn-secondary">A</button>' >> $html_tmp
echo '  <button type="button" id="B" onclick="select(this);" class="btn btn-secondary">B</button>' >> $html_tmp
echo '  <button type="button" id="C" onclick="select(this);" class="btn btn-secondary">C</button>' >> $html_tmp
echo '  <button type="button" id="D" onclick="select(this);" class="btn btn-secondary">D</button>' >> $html_tmp
echo '  <button type="button" id="E" onclick="select(this);" class="btn btn-secondary">E</button>' >> $html_tmp
echo '  <button type="button" id="F" onclick="select(this);" class="btn btn-secondary">F</button>' >> $html_tmp

echo '  <button type="button" id="G" onclick="select(this);" class="btn btn-secondary">G</button>' >> $html_tmp
echo '  <button type="button" id="H" onclick="select(this);" class="btn btn-secondary">H</button>' >> $html_tmp
echo '  <button type="button" id="I" onclick="select(this);" class="btn btn-secondary">I</button>' >> $html_tmp
echo '  <button type="button" id="J" onclick="select(this);" class="btn btn-secondary">J</button>' >> $html_tmp
echo '  <button type="button" id="K" onclick="select(this);" class="btn btn-secondary">K</button>' >> $html_tmp
echo '  <button type="button" id="L" onclick="select(this);" class="btn btn-secondary">L</button>' >> $html_tmp

echo '  <button type="button" id="M" onclick="select(this);" class="btn btn-secondary">M</button>' >> $html_tmp
echo '  <button type="button" id="N" onclick="select(this);" class="btn btn-secondary">N</button>' >> $html_tmp
echo '  <button type="button" id="O" onclick="select(this);" class="btn btn-secondary">O</button>' >> $html_tmp
echo '  <button type="button" id="P" onclick="select(this);" class="btn btn-secondary">P</button>' >> $html_tmp
echo '  <button type="button" id="Q" onclick="select(this);" class="btn btn-secondary">Q</button>' >> $html_tmp
echo '  <button type="button" id="R" onclick="select(this);" class="btn btn-secondary">R</button>' >> $html_tmp

echo '  <button type="button" id="S" onclick="select(this);" class="btn btn-secondary">S</button>' >> $html_tmp
echo '  <button type="button" id="T" onclick="select(this);" class="btn btn-secondary">T</button>' >> $html_tmp
echo '  <button type="button" id="U" onclick="select(this);" class="btn btn-secondary">U</button>' >> $html_tmp
echo '  <button type="button" id="V" onclick="select(this);" class="btn btn-secondary">V</button>' >> $html_tmp
echo '  <button type="button" id="W" onclick="select(this);" class="btn btn-secondary">W</button>' >> $html_tmp
echo '  <button type="button" id="X" onclick="select(this);" class="btn btn-secondary">X</button>' >> $html_tmp

echo '  <button type="button" id="Y" onclick="select(this);" class="btn btn-secondary">Y</button>' >> $html_tmp
echo '  <button type="button" id="Z" onclick="select(this);" class="btn btn-secondary">Z</button>' >> $html_tmp

echo '</div>' >> $html_tmp

echo '<br/>' >> $html_tmp