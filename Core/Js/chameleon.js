$(document).ready(function() {
	// Stuff to do as soon as the DOM is ready;

	// a-img problem
	$('.content a > img').parent().addClass('linkedImage');

	//dropdown for smartphone and tablet (portrait)
	var pageTitle = document.getElementById("currentPage");
	var backgroundColor = $('.background').css('background-color');

	//fill in current page-title
	$('#currentPage').text($('.selected').text());

	//convert rgb to hex and add 31 to hex#1 and hex#2 for hover
	rgb = backgroundColor.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
	var linkHoverColor =
		"#" +
  		("0" + (parseInt(rgb[1],10) + 0).toString(16)).slice(-2) +
  		("0" + (parseInt(rgb[2],10) - 31).toString(16)).slice(-2) +
  		("0" + (parseInt(rgb[3],10) - 31).toString(16)).slice(-2);

	//border, links get same color as background
	$('.background').css('border-color',backgroundColor);
	$('#main a').css('color',backgroundColor);
	$('#main a')
		.mouseenter(function(){
			$(this).css('color',linkHoverColor)
		})
		.mouseleave(function(){
			$(this).css('color',backgroundColor)
		});
		
	// enable the share-menu
	if($('.share').length > 0) $('.share').shareMenu();
});

	//action on menu dropdown
	navigationList = document.getElementById("navigationList");

	var j = 0;
	$('#currentPage').click(function(){

		if(j%2 == 0){
		    navigationList.style.display = "block";
		    j++;
		}
		else{
		    navigationList.style.display = "none";
		    j++;
		}
	});

