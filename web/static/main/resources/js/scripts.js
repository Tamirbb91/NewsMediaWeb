$(function(){
	$("#comment_send").click(checkValidation);
	$("#btn_readmore").click(clickReadmore);
});

function checkValidation(){
	var patternName = RegExp('^[a-zA-Z\-\. ]{2,}$');
	var patternBody = RegExp('^[a-zA-Z0-9\-\+\=\.\,\(\)\-\?\!\@\$\% \n\t]{10,}$');
	var comment_name = $("#comment_name");
	var comment_body = $("#comment_body");
	var newsid = $("#cnewsid");
	var comment_alertparag = $("#comment_alertparag");
	if(patternName.test(comment_name.val())){
		comment_alertparag.text("Lets be creative! Write a comment with at least 10 characters to be creative!");
		if(patternBody.test(comment_body.val())){
			comment_alertparag.removeClass("comment_alert");
			$("#comment_send").html("<img width='25' src='static/main/resources/contents/loading.gif' />");

			$.post("/addcomment",{
				"username" : comment_name.val(),
				"comment" : comment_body.val(),
				"newsid" : newsid.val()
				})
				.done(addCommentToBody)
				.fail(function(){
					alert("Oops there is error, sorry try again!");
				})
				.always(function(){
                    comment_body.val("");
                	setTimeout(function(){$("#comment_send").html("POST IT");},1000);
				});

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
	$("#btn_readmore").html("<img width='30' src='static/main/resources/contents/loading.gif' />");
}

function addCommentToBody(data){
    $("#comment_alertparag").val(data);
    var listCount = $("#comment_timeline li").length;
	console.log(listCount);
	var direction = listCount%2==0 ? "direction-r" : "direction-l";
	$("<li>\n" +
        "                    <div class=\" "+direction+" \">\n" +
        "                        <div class=\"flag-wrapper\">\n" +
        "                            <span class=\"hexa\"></span>\n" +
        "                            <span class=\"flag\">"+$('#comment_name').val()+"</span>\n" +
        "                            <span class=\"time-wrapper\"><span class=\"time\">"+Date()+"</span></span>\n" +
        "                        </div>\n" +
        "                        <div class=\"desc\">"+$('#comment_body').val()+"\n" +
        "                        </div>\n" +
        "                    </div>\n" +
        "                </li>").appendTo("#comment_timeline");
}