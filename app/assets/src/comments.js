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
                let image_preview_node = $('#'+comment_box.attr('id')+'-comment-file-display');
                image_preview_node.addClass('d-none');
                image_preview_node.attr('src', '');
            }
        });
    }

    $('.comment-attachment').on('click', function(){
        let tweet_id = $(this).data('tweet-id');
        $(`#${tweet_id}-comment-file-input`).click();
        $(`#${tweet_id}`).focus();
    })

    $('.comment-file-input').on('change', function(){
        const file = $(this).prop('files')[0];
        let image_preview_node = $(this).attr('id').replace('-input', '-display');
        if (file) {
            $(`#${image_preview_node}`).removeClass('d-none');
            $(`#${image_preview_node}`).attr('src', URL.createObjectURL(file));
        }
        else {
            $(`#${image_preview_node}`).addClass('d-none');
            $(`#${image_preview_node}`).attr('src', '');
        }
    });
});
