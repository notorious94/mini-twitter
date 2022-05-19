$(document).ready(function () {

    $("textarea").each(function () {
        this.setAttribute("style", "height:" + (this.scrollHeight) + "px;overflow-y:hidden;");
    }).on("input", function () {
        this.style.height = "auto";
        this.style.height = (this.scrollHeight) + "px";
    });

    if($('#attachment-icon').length){
        $('#attachment-icon').on('click', function(){
            $('#tweet-file-field').click();
        });
    }

    $('#tweet-file-field').on('change', function() {
        const file = $(this).prop('files')[0];
        let image_tag = $('.tweet-image');
        if (file) {
            image_tag.removeClass('d-none');
            image_tag.attr("src", URL.createObjectURL(file));
        }
        else {
            image_tag.addClass('d-none');
            image_tag.attr('src', '');
        }
    });
});
