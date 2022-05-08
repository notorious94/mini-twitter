$(document).ready(function () {
    const sign_up = $('#sign-up-page');
    const sign_in = $('#sign-in-page');
    console.log('Hi');
    if(sign_up.length || sign_in.length){
      $(document.body).removeClass('main-flex-container')
    }
    else {
      $(document.body).addClass('main-flex-container')
    }
});