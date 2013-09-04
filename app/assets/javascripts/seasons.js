$(document).ready(function ($) {
    $("form").on('change', "select", function (event) {
        var select_id = event.currentTarget.id;
        var select_name = event.currentTarget.name;
        var day_id = $("#" + event.delegateTarget.id + " .day_field").val();
        var person = { field:select_name, value: $("#"+select_id).val()};

        $.post("/workdays/"+day_id, {id:day_id, person:person}, null, "script");

    });
});
