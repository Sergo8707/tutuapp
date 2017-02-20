update_carriage_seats_fields = function () {
    $('.carriage-seats').hide();

    var selected_value = $('#carriage_type').val();

    if (selected_value == 'CupeCarriage' || selected_value == 'PlatcCarriage') {
        $('#carriage_group_top_seats').show();
    }

    if (selected_value == 'CupeCarriage' || selected_value == 'PlatcCarriage' || selected_value == 'UpholsteredCarriage') {
        $('#carriage_group_bottom_seats').show();
    }

    if (selected_value == 'PlatcCarriage') {
        $('#carriage_group_side_top_seats').show();
        $('#carriage_group_side_bottom_seats').show();
    }

    if (selected_value == 'SeatsCarriage') {
        $('#carriage_group_seats').show();
    }


    $('.carriage-seats:hidden input').val(0)
};

document.addEventListener("turbolinks:load", function () {
    update_carriage_seats_fields();

    $('#carriage_type').change(function () {
        update_carriage_seats_fields();
    });
});