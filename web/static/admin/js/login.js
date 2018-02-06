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
            $("#toast").html(result["message"]).css("display", "block");
            window.setTimeout(function(){
                $("#toast").html("").css("display", "none");
            }, 3000);
        }

        if(result["result"] === 'success'){
            window.location = "/static/admin/jsp/home.jsp";
        }
    })
}