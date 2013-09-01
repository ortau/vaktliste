$.fn.subSelectWithAjax = function () {
    var that = this;
    this.change(function () {
        console.log(that);
        console.log(that.attr('rel'));
        console.log(that.val());
        $.post("/workdays/"+that.val(), {id:that.val()}, null, "script");
    });

}

$(document).ready(function ($) {
    $("form").on('change', "select", function (event) {
        console.log(event);

        var select_id = event.currentTarget.id;
        var select_name = event.currentTarget.name;
        console.log("select id: " + select_id);
        var day_id = $("#" + event.delegateTarget.id + " .day_field").val();
        console.log("day id: " + day_id);


        var person = { field:select_name, value: $("#"+select_id).val()};

        $.post("/workdays/"+day_id, {id:day_id, person:person}, null, "script");

    });
});
