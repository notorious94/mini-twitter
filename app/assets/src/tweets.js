$(document).ready(function () {
    document.getElementById('attachment-icon').addEventListener('click',
        function() {
            document.getElementById('file-field').click();
        },
        false
    );
});
