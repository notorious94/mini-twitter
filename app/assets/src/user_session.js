$(document).ready(function () {
    const sign_up = $('#sign-up-page');
    const sign_in = $('#sign-in-page');
    if(sign_up.length || sign_in.length){
      $(document.body).removeClass('main-flex-container');
      $('#sidebar').addClass('d-none');
    }
    else {
        $(document.body).addClass('main-flex-container');
        $('#sidebar').removeClass('d-none');
    }
});
