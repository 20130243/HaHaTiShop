function alert_popup(name, message) {
    $('body').append(`<div id="${name}_alert" class="alert alert-${name}" style="width: 25%;position:fixed;opacity:0;top:0;right:0"
 role="alert"> ${message}</div>`)
    $("#" + name + "_alert").animate({top: '80px', right: "10px", opacity: 1}, 1000)
        .delay(1000)
        .animate({right: '-1000px'}, 2000, function () {
            $(this).remove()
        });
}