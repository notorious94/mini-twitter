$(document).ready(function () {
    const home_section = $('#nav-home');
    const latest_section = $('#nav-latest');
    const show_page = $('#show-page');
    if(home_section.length || latest_section || show_page){
        $('.create-comment').off().on("keypress", function (e){
            let element = $(this);
            if (e.key === "Enter" && element.val()) {
                e.preventDefault();
                $.ajax({
                    url: "/comments/create_tweet_comment",
                    type: "POST",
                    data: {
                        "tweet_id": $(this).data('tweet-id'),
                        "user_id": $(this).data('user-id'),
                        "comment": $(this).val()
                    },
                    success: function (data) {
                        let content = $('[data-role="comment-template"]').first().clone(true, true);
                        content.find('[data-role="comment-creator-photo"]').attr(
                            "src",
                            location.protocol +
                            "//" + location.host +
                            data.author_image
                        );
                        content.find('[data-role="comment-creator-name"]').text(data.author_name);
                        content.find('[data-role="comment-time"]').text(data.create_time);
                        content.find('[data-role="comment-body"]').text(data.body);
                        content.find('[data-role="comment-template"]');
                        content.removeClass("d-none");
                        $(`#${data.tweet_id}-comment-section`).prepend(content.removeClass("d-none"));
                        $(`#${data.tweet_id}-comment-count`).text(data.total_comments);
                        element.val('');
                    }
                });
            }
        });
    }
});
