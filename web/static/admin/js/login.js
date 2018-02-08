$(function(){
    $("#login_button").click(login);

    $("#email").keypress(function(e) {
        if(e.which == 13) {
            $("#password").focus();
        }
    });

    $("#password").keypress(function(e) {
        if(e.which == 13) {
            login();
        }
    });

    $("#email").focusout(function(){
        $("#email").addClass("shake");
        setTimeout(function(){
            $("#email").removeClass("shake");
        }, 1000)
    });
});

function login(){
    var email = $("#email").val();
    var password = $("#password").val();
    $.post("/admin", {email: email, password: password}, function(data, status, xhr){
        console.log(data);
        console.log(status);

        var result = JSON.parse(data);
        console.log(result);
        if(result["result"] === 'failed'){
            $("#toast").html(result["message"]).addClass("rise").css("display", "block");
            window.setTimeout(function(){
                $("#toast").html("").removeClass("rise").css("display", "none");
            }, 3000);
        }

        if(result["result"] === 'success'){
            window.location = "/news";
        }
    })
}