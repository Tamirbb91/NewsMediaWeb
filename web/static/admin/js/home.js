$(function(){
    $(".delete_post").click(deletePost);
    $(".edit_post").click(editPost);
    $("#logout").click(logout);
    $("#add_new_post").click(newPost);
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

function newPost(){
    window.location = "/static/admin/jsp/new.jsp";
}