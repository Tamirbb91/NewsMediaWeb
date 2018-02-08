$(function () {
    $("#logout").click(logout);

    $("#logo").click(function(){
        window.location = "/news";
    });

    $(".add_attribute").click(
        function () {
            $("<div>").attr({
                class: "attribute"
            })
                .append(
                    $("<h4>").html("Attribute")
                )
                .append(
                    $("<div>").attr({
                        class: "attribute_div"
                    })
                        .append(
                            $("<input>").attr(
                                {
                                    class: "attribute_key",
                                    type: "text",
                                    value: "",
                                    placeholder: "Key"
                                }
                            )
                        )
                        .append(
                            $("<input>").attr(
                                {
                                    class: "attribute_value",
                                    type: "text",
                                    value: "",
                                    placeholder: "Value"
                                }
                            )
                        )
                )
                .insertBefore(this);
        }
    );

    $(".section_add").click(
        function(){
            $("<div>")
                .attr({
                    class: "section"
                })
                .append(
                    $("<h4>").html("Section")
                )
                .append(
                    $("<div>")
                        .attr({
                            class: "section_title"
                        })
                        .append(
                            $("<h4>").html("Section title")
                        )
                        .append(
                            $("<textarea>").attr({
                                class: "section_title_value"
                            })
                        )
                )
                .append(
                    $("<div>")
                        .attr({
                            class: "section_paragraph"
                        })
                        .append(
                            $("<h4>").html("Section paragraph")
                        )
                        .append(
                            $("<textarea>").attr({
                                class: "section_paragraph_value"
                            })
                        )
                )
                .append(
                    $("<div>")
                        .attr({
                            class: "section_images"
                        })
                        .append(
                            $("<h4>").html("Section images")
                        )
                        .append(
                            $("<form>").attr({
                                class: "sectionImageUpload",
                                enctype: "multipart/form-data"
                            })
                                .append(
                                    $("<input>").attr({
                                        name: "sectionImage",
                                        type: "file",
                                        multiple: "true"
                                    })
                                )
                                .append(
                                    $("<input>").attr({
                                        type: "button",
                                        value: "Upload"
                                    }).click(imageUpload)
                                )
                        )
                )
                .insertBefore(this);
        }
    );

    $("#publish").click(
        publishNews
    );

    $(".sectionImageUpload input[type=button]").click(imageUpload);
    $("#coverImageUpload input[type=button]").click(imageUpload);
});

function publishNews(){
    var news = new News();
    news.title = $("#title_value").val();
    news.category = $("input[name=category]:checked").val();
    var dataId = $("#coverImageUpload").attr("data-id");
    if(dataId){
        console.log(dataId);
        var coverImages = JSON.parse(dataId).images;
        if(coverImages.length == 1){
            news.coverImage = coverImages[0];
        }
    }

    news.introParagraph = $("#intro_paragraph_value").val();
    $(".attribute_div").each(function (index, value) {
        if($(this).children().eq(0).val() && $(this).children().eq(1).val()){
            var attribute = new Attribute($(this).children().eq(0).val(), $(this).children().eq(1).val());
            news.addAttribute(attribute);
        }
    });

    $(".section").each(function (index, value) {
        var section = new Section();
         if($(this).find(".section_title_value").val()){
            section.title = $(this).find(".section_title_value").val();
         }

        if($(this).find(".section_paragraph_value").val()){
            section.paragraph = $(this).find(".section_paragraph_value").val();
        }
        if($(this).find(".sectionImageUpload").attr("data-id")){
            var dataId = $(this).find(".sectionImageUpload").attr("data-id");
            console.log(dataId);
            if(dataId){
                console.log(dataId);
                var sectionImages = JSON.parse(dataId);
                console.log(sectionImages);
                console.log(sectionImages["images"]);
                var imagesPath = sectionImages["images"];

                for(var i=0; i < imagesPath.length; i++){
                    section.addImage(imagesPath[i]);
                }
            }
        }

        news.addSection(section);
    });
    console.log(news);
    publishNewsToServer(news);
}

function publishNewsToServer(news){
    $.post("/news", {news: JSON.stringify(news)}, function(data, status, xhr){
        // console.log(data);
        // console.log(status);

        var result = JSON.parse(data);
        console.log(result);
        if(result["result"] === 'failed'){
            $("#toast").html(result["message"]).css("display", "block").addClass("rise");
            window.setTimeout(function(){
                $("#toast").html("").removeClass("rise").css("display", "none");
            }, 3000);
        }

        if(result["result"] === 'success'){
            window.location = "/news";
        }
    });
}

function Attribute(key, value){
    this.title = key;
    this.body = value;
}

function Comment(username, comment, date){
    this.username = username;
    this.comment = comment;
    this.date = date;
}

function Section(){
    this.title = "";
    this.paragraph = "";
    this.images = [];
}

function News(){
    this.id = "";
    this.title = "";
    this.category = "";
    this.admin = {};
    this.coverImage = "";
    this.introParagraph = "";
    this.attributes = [];
    this.sections = [];
    this.videoURL = "";
    this.viewCount = 0;
    this.comments = [];
    this.publishedDate = ""
    this.emotionPoints = {
        "1": 0,
        "2": 0,
        "3": 0,
        "4": 0,
        "5": 0
    };
}

News.prototype.addAttribute = function(attribute){
    this.attributes.push(attribute);
};

News.prototype.addSection = function(section){
    this.sections.push(section);
};

Section.prototype.addImage = function(image){
    this.images.push(image);
};

function imageUpload() {
    var self = $(this);
    console.log(self.parent());
    $.ajax({
        url: "/image",
        type: "POST",
        data: new FormData(self.parent()[0]),
        cache: false,
        contentType: false,
        processData: false,
        success: function (data, status, xhr) {
            console.log(data);
            console.log(status);

            var result = JSON.parse(data);
            console.log(result);
            if (result["result"] === 'failed') {
                $("#toast").html(result["message"]).addClass("rise").css("display", "block");
                window.setTimeout(function () {
                    $("#toast").html("").removeClass("rise").css("display", "none");
                }, 3000);
            }

            if (result["result"] === 'success') {
                $("#toast").html(result["message"]).addClass("rise").css("display", "block");
                window.setTimeout(function () {
                    $("#toast").html("").removeClass("rise").css("display", "none");
                }, 3000);
                self.parent().attr("data-id", JSON.stringify({images : result["images"]}));
            }
        },
        error: function (e) {
            $("#toast").html("Image upload failed. Please try again.").css("display", "block").addClass("rise");
            window.setTimeout(function () {
                $("#toast").html("").removeClass("rise").css("display", "none");
            }, 3000);
            self.parent().attr("data-id",JSON.stringify({images: []}));
        }
    });
}

function logout(){
    window.location = "/admin";
}