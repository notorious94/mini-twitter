$(document).ready(function () {
    $('.like-icon').off().on('click', function(e){
       e.preventDefault();
       let like_button = $(this);
       let like_counter = like_button.next('.like-count');
       if(like_button.data('like-state')) {
           $.ajax({
               url: "/tweets/unlike_tweet",
               type: "POST",
               data: {
                   "tweet_id": $(this).data('tweet-id')
               },
               success: function (like_count) {
                   if(like_count === 0){
                       like_count = '';
                   }
                   like_counter.text(like_count);
                   like_button.addClass('mdi-heart-outline');
                   like_button.removeClass('mdi-heart');
                   like_button.data('like-state', !like_button.data('like-state'));
               }
           });
       }
       else {
           $.ajax({
               url: "/tweets/like_tweet",
               type: "POST",
               data: {
                   "tweet_id": $(this).data('tweet-id')
               },
               success: function (like_count) {
                   if(like_count === 0){
                       like_count = '';
                   }
                   like_counter.text(like_count);
                   like_button.removeClass('mdi-heart-outline');
                   like_button.addClass('mdi-heart');
                   like_button.data('like-state', !like_button.data('like-state'));
               }
           });
       }
    });
});
