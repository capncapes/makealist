// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {
	var copyright = document.getElementById("copyright-years");
	var year = new Date().getFullYear();
	
	if (year != 2018) {
		copyright.innerHTML = "2018 - " + year;
	} else {
		copyright.innerHTML = year;
	}

	var today = new Date();
	var hourNow = today.getHours();

	var sun = document.getElementById("sun");
	var moon = document.getElementById("moon");
	var stars = document.getElementById("stars");
	var greeting;

	if (hourNow >= 18) {
		$(".jumbotron.jumbotron-fluid").addClass("evening");
		moon.setAttribute("style", "visibility: visible;");
		stars.setAttribute("style", "visibility: visible;");
		greeting = "Good evening!";
	} else if (hourNow >= 12) {
		$(".jumbotron.jumbotron-fluid").addClass("afternoon");
		sun.setAttribute("style", "top: -40%; visibility: visible;");
		greeting = "Good afternoon!";
	} else if (hourNow >= 0) {
		$(".jumbotron.jumbotron-fluid").addClass("morning");
		sun.setAttribute("style", "bottom: -40%; visibility: visible;");
		greeting = "Good morning!";
	} else {
		greeting = "Hello!";
	}

	document.getElementById("greeting").innerHTML = greeting;
});