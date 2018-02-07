$(function () {
    $("#comment_send").click(checkValidation);
    $("#btn_readmore").click(clickReadmore);
    $(".anchoremotions").click(clickedEmotions);
});

function checkValidation() {
    var patternName = RegExp('^[a-zA-Z\-\. ]{2,}$');
    var patternBody = RegExp('^[a-zA-Z0-9\-\+\=\.\,\(\)\-\?\!\@\$\% \n\t]{10,}$');
    var comment_name = $("#comment_name");
    var comment_body = $("#comment_body");
    var newsid = $("#cnewsid");
    var comment_alertparag = $("#comment_alertparag");
    if (patternName.test(comment_name.val())) {
        comment_alertparag.text("Lets be creative! Write a comment with at least 10 characters to be creative!");
        if (patternBody.test(comment_body.val())) {
            comment_alertparag.removeClass("comment_alert");
            $("#comment_send").html("<img width='25' src='static/main/resources/contents/loading.gif' />");

            $.post("/addcomment", {
                "username": comment_name.val(),
                "comment": comment_body.val(),
                "newsid": newsid.val()
            })
                .done(function () {
                    setTimeout(addCommentToBody, 900);
                })
                .fail(function () {
                    alert("Oops there is error, sorry try again!");
                })
                .always(function () {
                    setTimeout(function () {
                        comment_body.val("");
                        $("#comment_send").html("POST IT");
                    }, 1000);
                });

        } else {
            comment_alertparag.addClass("comment_alert");
            comment_body.focus();
        }
    } else {
        comment_alertparag.text("Please write your name");
        comment_alertparag.addClass("comment_alert");
        comment_name.focus();
    }
}

function addCommentToBody(data) {
    $("#comment_alertparag").val(data);
    var listCount = $("#comment_timeline li").length;
    console.log(listCount);
    var direction = listCount % 2 == 0 ? "direction-r" : "direction-l";
    $("<li>\n" +
        "                    <div class=\" " + direction + " \">\n" +
        "                        <div class=\"flag-wrapper\">\n" +
        "                            <span class=\"hexa\"></span>\n" +
        "                            <span class=\"flag\">" + $('#comment_name').val() + "</span>\n" +
        "                            <span class=\"time-wrapper\"><span class=\"time\">" + Date() + "</span></span>\n" +
        "                        </div>\n" +
        "                        <div class=\"desc\">" + $('#comment_body').val() + "\n" +
        "                        </div>\n" +
        "                    </div>\n" +
        "                </li>").appendTo("#comment_timeline");
}

function clickedEmotions() {
    if ($(this).attr("disabled") != "disabled") {
        var emotion = this.id.substring(7);
        var newsid = $("#cnewsid");
        $.post("/addemotionpoint", {
            "emotion": emotion,
            "newsid": newsid.val()
        })
            .done(addEmotionPoint(emotion))
            .fail(function () {
                alert("Oops there is error, sorry try again!");
            });
    }
}

function addEmotionPoint(id) {
    $("#reactions_value_" + id).css("height", function (idx, old) {
        return parseInt(old) + 1 + "px";
    });
    $(".anchoremotions").attr("disabled", "disabled");
    $("#emotion" + id).addClass("blink_me");
}

function clickReadmore() {
    var newsids = $('.newsids_class').map(function () {
        return $(this).val()
    }).get();
    var cat = $(".category_class").val();

    console.log(cat);
    $("#divreadmore").show();
    $("#divreadmore .bubble").html("<img width='30' src='static/main/resources/contents/loading.gif' />");
    $.get("/readmore", {"newsids": newsids,"category":cat})
        .done(addMoreNews)
        .fail(function (e) {
            console.log(e);
            $(".div_readmore").hide();
        })
        .always(function () {
            setTimeout(function () {
                $("#divreadmore .bubble").hide();
            }, 2000);
        });
}

function addMoreNews(data) {
    console.log(data);
    if (data!="nothing new") {
        setTimeout(function () {
            $("#divreadmore").append(data);
        }, 2000);
    } else {
        $(".div_readmore").hide();
    }

}