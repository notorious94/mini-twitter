$(document).ready(function () {
    if($('#flash-button').length){
        setTimeout(function() {
            $('#flash-button').click();
            console.log('Hello');
        }, 2000);
    }
})
