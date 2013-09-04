$(document).ready(function ($) {
    $("form").on('change', "input", function (event) {
        var input_id = event.currentTarget.id;
        var input_name = event.currentTarget.name;
        var status_id = $("#" + event.delegateTarget.id + " .status_field").val();
        var user_input = { field:input_name, value: $("#"+input_id).val()};

        $.post("/availability_statuses/" + status_id, {id:status_id, user_input:user_input}, null, "script");

    });
});
