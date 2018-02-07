$(function () {
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
                .insertBefore(this);
        }
    );

    $("#publish").click(
        publishNews
    );
});

function publishNews(){
    var news = new News();
    news.id = $(".content").attr("data-id");
    news.title = $("#title_value").val();
    news.category = $("input[name=category]:checked").val();

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

        news.addSection(section);
    });
    console.log(news);
    publishNewsToServer(news);
}

function publishNewsToServer(news){
    $.ajax({
        url: "/updateNews",
        type: "POST",
        data: {"news": news},
        success: function(data, status, xhr){
            // console.log(data);
            // console.log(status);

            var result = JSON.parse(data);
            console.log(result);
            if(result["result"] === 'failed'){
                $("#toast").html(result["message"]).css("display", "block");
                window.setTimeout(function(){
                    $("#toast").html("").css("display", "none");
                }, 3000);
            }

            if(result["result"] === 'success'){
                window.location = "/news";
            }
        }
    });
}

function Attribute(key, value){
    this.key = key;
    this.value = value;
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
}

News.prototype.addAttribute = function(attribute){
    this.attributes.push(attribute);
};

News.prototype.addSection = function(section){
    this.sections.push(section);
};

