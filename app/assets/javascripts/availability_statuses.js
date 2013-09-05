function post_available(status_id, event) {
    var input_name = event.name;
    var user_input = { field:input_name, value: event.value};

    $.post("/availability_statuses/" + status_id, {id:status_id, user_input:user_input}, null, "script");
}
function post_on_wishlist(status_id, event) {
    var input_name = event.name;
    var value = 0;
    if (event.checked) {
        value = 1;
    }
    var user_input = { field:input_name, value: value};

    $.post("/availability_statuses/" + status_id, {id:status_id, user_input:user_input}, null, "script");
}