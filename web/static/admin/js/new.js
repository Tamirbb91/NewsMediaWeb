$(function () {
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

    $(".section_image_add").click(
        sectionImageOnclick
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
                            $("<div>").attr({
                                class: "section_image"
                            })
                                .append(
                                    $("<h4>").html("Section image")
                                )
                                .append(
                                    $("<input>").attr({
                                        class: "sectionImage",
                                        type: "text",
                                        value: ""
                                    })
                                )
                        )
                        .append(
                            $("<div>").attr({
                                class: "section_image_add"
                            })
                                .append(
                                    $("<span>").html("Add image")
                                )
                                .click(sectionImageOnclick)
                        )
                )
                .insertBefore(this);
        }
    );

    $(".publish").click(
        publishNews
    );
});

function sectionImageOnclick(){
    $("<div>").attr({
        class: "section_image"
    })
        .append(
            $("<h4>").html("Section image")
        )
        .append(
            $("<input>").attr({
                class: "sectionImage",
                type: "text",
                value: ""
            })
        )
        .insertBefore(this);
}

function publishNews(){
    var news = new News();
    news.title = $("#title_value").html();
    news.category = $("#category_value").html();
    news.coverImage = $("#cover_image_value").html();
    news.introParagraph = $("#intro_paragraph_value").html();
    $(".attribute_div").forEach(function (value) {
        news.attributes.push(new Attribute($(this).first().val(), $(this).second().val()))
    })

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

Section.prototype.addImage = function(image){
    this.images.push(image);
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

