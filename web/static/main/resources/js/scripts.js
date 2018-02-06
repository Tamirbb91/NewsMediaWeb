$(function(){
	$("#comment_send").click(checkValidation);
	$("#btn_readmore").click(clickReadmore);
});

function checkValidation(){
	var patternName = RegExp('^[a-zA-Z\-\. ]{2,}$');
	var patternBody = RegExp('^[a-zA-Z0-9\-\+\=\.\,\(\)\-\?\!\@\$\% \n\t]{100,}$');
	var comment_name = $("#comment_name");
	var comment_body = $("#comment_body");
	var comment_alertparag = $("#comment_alertparag");
	if(patternName.test(comment_name.val())){
		comment_alertparag.text("Lets be creative! Write a comment with at least 100 characters to be creative!");
		if(patternBody.test(comment_body.val())){
			comment_alertparag.removeClass("comment_alert");
			$("#comment_send").html("<img width='25' src='resources/loading.gif' />");
		}else{
			comment_alertparag.addClass("comment_alert");	
			comment_body.focus();
		}
	}else{
		comment_alertparag.text("Please write your name");
		comment_alertparag.addClass("comment_alert");
		comment_name.focus();
	}
}

function clickReadmore(){
	$("#btn_readmore").html("<img width='30' src='resources/loading.gif' />");
}