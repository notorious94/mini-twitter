$(document).ready(function () {
    // document.getElementById('attachment-icon').addEventListener('click',
    //     function() {
    //         document.getElementById('file-field').click();
    //     },
    //     false
    // );

    $("textarea").each(function () {
        this.setAttribute("style", "height:" + (this.scrollHeight) + "px;overflow-y:hidden;");
    }).on("input", function () {
        this.style.height = "auto";
        this.style.height = (this.scrollHeight) + "px";
    });
});
