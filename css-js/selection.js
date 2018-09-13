function select(button) {

	var str = "Hello world, welcome to the universe.";
    var n = str.startsWith("Hello");
    document.getElementById("selected").innerHTML = n;
	
	defaultColorAllButtons();	

	button.style="color: red;";

	var resources=document.getElementById("resources").getElementsByClassName("resource");

	var found=0;

	for (var i = resources.length - 1; i >= 0; i--) {

		var name=resources[i].getElementsByClassName("name")[0].innerHTML;
		if( name.startsWith(button.innerHTML) || name.startsWith(button.innerHTML.toLowerCase()) ){
			found++;
			resources[i].style="display: initial;";
		}
		else{
			resources[i].style="display: none;";
		}
	}

	document.getElementById("selected").innerHTML=found;
}

function selectAll(button){

	button.style="color: red;";

	var resources=document.getElementById("resources").getElementsByClassName("resource");

	var found=0;

	for (var i = resources.length - 1; i >= 0; i--) {
		resources[i].style="display: initial;";
		found++;
	}

	document.getElementById("selected").innerHTML=found;	
}

function defaultColorAllButtons() {
	
	var buttons= document.getElementById("selection-buttons").getElementsByTagName("button");

//	alert("There are "+ buttons.length +" bttons");

	for (var i = buttons.length - 1; i >= 0; i--) {
		buttons[i].style="color: inherit;";	
	}
	
}
