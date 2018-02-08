$(function () {
    $("#comment_send").click(checkValidation);
    $("#btn_readmore").click(clickReadmore);
    $(".anchoremotions").click(clickedEmotions);
    $(".fixedanchoremotions").hover(focusedEmotions, unfocusedEmotions);
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
            $("#comment_container").html("<img width='25' src='static/main/resources/contents/loading.gif' />");

            $.post("/addcomment", {
                "username": comment_name.val(),
                "comment": comment_body.val(),
                "newsid": newsid.val()
            })
                .done(function (data) {
                    setTimeout(addCommentToBody(data), 1000);
                })
                .fail(function () {
                    alert("Oops there is error, sorry try again!");
                })
                .always(function () {
                    setTimeout(function () {
                        comment_body.val("");
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
    $("#comment_container").html(data);
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
    var emotion = $(".emotion_class").val();
    console.log(emotion);
    console.log(cat);
    $("#divreadmore").show();
    $("#divreadmore .bubble").html("<img width='30' src='static/main/resources/contents/loading.gif' />");
    $.get("/readmore", {"newsids": newsids, "category": cat, "emotion": emotion})
        .done(addMoreNews)
        .fail(function (e) {
            console.log(e);
            $(".div_readmore").hide();
        })
        .always(function () {
            setTimeout(function () {
                $("#divreadmore .bubble").hide();
            }, 500);
        });
}

function addMoreNews(data) {
    console.log(data);
    if (data != "nothing new") {
        setTimeout(function () {
            $("#divreadmore").append(data);
        }, 500);
    } else {
        $(".div_readmore").hide();
    }

}

function focusedEmotions() {
    $(this).addClass("blink_me");
}


function unfocusedEmotions() {
    $(this).removeClass("blink_me");
}