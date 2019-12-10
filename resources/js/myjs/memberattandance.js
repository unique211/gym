$(document).ready(function() {

    getallsechedule();

    function getallsechedule() {
        var starttime = $("#start_time").text();
        var end_time = $("#end_time").text();
        var date = $("#today").text();

        var time = $("#starttime").val();

        starttime = starttime.split(" ");


        var hrs = starttime[0].split(":");

        if (starttime[1] == "PM" && hrs[0] < 12) hrs[0] = parseInt(hrs[0]) + parseInt(12);
        if (starttime[1] == "AM" && hrs[0] == 12) hrs[0] = parseInt(hrs[0]) - parseInt(12);
        var shours = hrs[0].toString();

        shours = shours + ":" + "00" + ":" + "00";
        end_time = end_time.split(" ");


        var hrs1 = end_time[0].split(":");


        if (end_time[1] == "PM" && hrs1[0] < 12) hrs1[0] = parseInt(hrs1[0]) + parseInt(12);
        if (end_time[1] == "AM" && hrs1[0] == 12) hrs1[0] = parseInt(hrs1[0]) - parseInt(12);
        var ehours = hrs1[0].toString();
        console.log(ehours);


        ehours = ehours + ":" + "00" + ":" + "00";






        var tdateAr = date.split('/');
        var start_time = tdateAr[2] + '-' + tdateAr[1] + '-' + tdateAr[0] + " " + shours;

        var tdateAr = date.split('/');
        var end_time = tdateAr[2] + '-' + tdateAr[1] + '-' + tdateAr[0] + " " + ehours;


        $.ajax({
            data: {
                start_time: start_time,
                end_time: end_time,

            },
            url: getdata,
            type: "POST",
            dataType: 'json',
            async: false,
            success: function(data) {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {

                        var html = '<tr><td>' + data[i].classname + '</td>' +
                            '<td>' + data[i].instructorname + '</td>' +
                            // '<td>' + data[i].class_schedule + '</td>' +
                            '<td> <a href="#">Take Attendence</a> </td>' +

                            "</tr>";

                        $('#classlisttbody').append(html);


                    }
                }

            },
            error: function(data) {
                console.log('Error:', data);
            }
        });
    }

});