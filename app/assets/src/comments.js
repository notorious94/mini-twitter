$(document).ready(function () {
    const home_section = $('#nav-home');
    const latest_section = $('#nav-latest');
    const show_page = $('#show-page');
    if(home_section.length || latest_section || show_page){
        $('.create-comment').off().on("keypress", function (e){
            let comment_box = $(this);
            if (e.key === "Enter" && comment_box.val().trim()) {
                e.preventDefault();
                $(`#${comment_box.attr("id")}-submit-comment`).click();
                comment_box.val('');
            }
        });
    }
});
