$(document).ready(function () {
    const tweet_box = $('#tweet-box');
    if(tweet_box.length){
        tweet_box.keyup(function(){
            console.log($('#tweet-box').val().trim());
        })
    }
});