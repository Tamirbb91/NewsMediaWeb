$(function(){
    $(".delete_post").click(deletePost);
    $(".edit_post").click(editPost);
    $("#logout").click(logout);
    $("#add_new_post").click(newPost);
    $("#logo").click(function(){
        window.location = "/news";
    });
});

function deletePost(){
    var newsId = $(this).attr("data-id");
    console.log(newsId);
    var self = $(this);
    $.ajax({
        url: "/updateNews" + "?" + $.param({"newsId": newsId}),
        type: "GET",
        success: function (data, status, xhr) {
            console.log(data);
            console.log(status);

            var result = JSON.parse(data);
            console.log(result);
            if (result["result"] === 'failed') {
                $("#toast").html(result["message"]).css("display", "block");
                window.setTimeout(function () {
                    $("#toast").html("").css("display", "none");
                }, 3000);
            }

            if (result["result"] === 'success') {
                $("#toast").html(result["message"]).css("display", "block");
                window.setTimeout(function () {
                    $("#toast").html("").css("display", "none");
                }, 3000);
                self.parent().parent().remove();
            }
        },
        error: function (e) {
            $("#toast").html("Failed. Please try again.").css("display", "block");
            window.setTimeout(function () {
                $("#toast").html("").css("display", "none");
            }, 3000);
        }
    });
}

function editPost(){
    var newsId = $(this).attr("data-id");
    window.location = "/news" + "?" + $.param({"newsId": newsId});
}

function logout(){
    alert("logout");
}

function newPost(){
    window.location = "/static/admin/jsp/new.jsp";
}