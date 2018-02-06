$(function(){
    $(".delete_post").click(deletePost);
    $(".edit_post").click(editPost);
    $("#logout").click(logout);
});

function deletePost(){
    alert("delete it");
}

function editPost(){
    alert("edit it");
}

function logout(){
    alert("logout");
}