$(document).ready(function () {
    const tweet_box = $('#tweet-box');
    if(tweet_box.length){
        tweet_box.keyup(function(){
        })
    }
    //
    // $('.create-comment').on("keypress", function (e){
    //     if (e.key === "Enter") {
    //         e.preventDefault();
    //         let tweet_id = $(this).data('tweet-id');
    //         $(`#${tweet_id}-submit-comment`).click();
    //         $(this).val('');
    //         // document.getElementById("myBtn").click();
    //     }
    // })
});