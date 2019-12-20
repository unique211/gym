$(document).ready(function() {


    validate = 1;


    //for submite of from inserting or updating Recored  --------Start
    $(document).on('submit', '#master_form', function(e) {
        e.preventDefault();

        if (validate == 1) {
            var share = 0;
            if ($('#share').is(":checked")) {
                share = 1;
            } else {
                share = 0;
            }


            $('#allowshare').val(share);

            $.ajax({
                data: $('#master_form').serialize(),
                url: add_data,
                type: "POST",
                dataType: 'json',
                success: function(data) {

                    datashow();

                    successTost("Opration Save Success fully!!!");

                    from_clear();


                },
                error: function(data) {
                    console.log('Error:', data);

                }
            });
        } else {
            swal({
                title: "Title already Exist",
                text: "Please Enter Another Title  !!",
                type: "warning",
            });
        }

    });
    //for submite of from inserting or updating Recored  --------Start

    datashow();

    //form clear ------Strat
    function from_clear() {

        $('#upload').val('');
        $('#uploadimg_hidden').val('');
        $('#msg').html('');
        $('#desc').val('');

        $("#share").prop("checked", true);
        $('#save_update').val('');
        $("#upload").attr("required", true);
        $('#btnsave').text('Save');
    }
    //form clear ------End
    //datashow();
    //for desplay in table with data toggel Buttton------Strat
    function datashow() {
        $.get('getallgallary', function(data) {
            var startdate = "";
            var end_date = "";
            var st = "";
            var data = eval(data);
            var html = '';

            for (var i = 0; i < data.length; i++) {
                var sr = i + 1;
                st = data[i].allowshare;



                html += '<tr>' +

                    '<td id="desc_' + data[i].gallary_id + '">' + data[i].description + '</td>' +


                    '<td style="display:none;" id="uploadimg_' + data[i].gallary_id + '">' + data[i].uploadimg + '</td>';

                if (st == 1) {
                    html += '<td id="user_id_' + data[i].gallary_id + '"> 	<label class="checkbox-inline" style="margin-left:50px;">	<input type="checkbox" class="btnstatus"  id="chekcstatus_' + data[i].gallary_id + '" name="chekcstatus_' + data[i].gallary_id + '" checked data-toggle="toggle"    data-on="Yes" data-off="No"  data-onstyle="success" data-offstyle="danger"  ></label></td>';
                } else {
                    html += '<td id="user_id_' + data[i].gallary_id + '"> <label class="checkbox-inline" style="margin-left:50px;">	<input type="checkbox" class="btnstatus"  id="chekcstatus_' + data[i].gallary_id + '" name="chekcstatus_' + data[i].gallary_id + '"  data-toggle="toggle"    data-on="Yes" data-off="No"  data-onstyle="success" data-offstyle="danger"  ></label></td>';
                }



                html += '<td class="not-export-column" ><button name="edit"  value="edit" class="edit_data btn btn-xs btn-success" id=' +
                    data[i].gallary_id +
                    '  status=' + data[i].allowshare + '><i class="fa fa-edit"></i></button>&nbsp;<button name="delete" value="Delete" class="delete_data btn btn-xs btn-danger" id=' +
                    data[i].gallary_id + '><i class="fa fa-trash"></i></button></td>' + '</tr>';


            }

            $('#table_tbody').html(html);
            $('.btnstatus').bootstrapToggle({
                on: 'Yes',
                off: 'No'
            });
            $('#laravel_crud').DataTable({});


        })

    }
    //for desplay in table with data toggel Buttton------End

    //Edit Button Code Strat Here
    $(document).on('click', ".edit_data", function(e) {
        e.preventDefault();

        var id = $(this).attr("id");
        var status = $(this).attr("status");

        if (status == 1) {

            $('#share').bootstrapToggle('on');

        } else {
            $('#share').bootstrapToggle('off');

        }
        var desc = $('#desc_' + id).html();
        var uploadimg = $('#uploadimg_' + id).html();

        if (uploadimg == "") {
            $("#upload").attr("required", true);
        } else {
            $("#upload").removeAttr("required");
        }



        $('#uploadimg_hidden').val(uploadimg);
        $('#msg').html(uploadimg);

        $('#save_update').val(id);
        $('#desc').val(desc);
        $('#save_update').val(id);
        $('#btnsave').text('Update');




    });
    //Edit Button Code End  Here------


    //Delete  Button Code Strat  Here------

    $(document).on('click', '.delete_data', function() {
        var id1 = $(this).attr('id');

        if (id1 != "") {
            swal({
                    title: "Are you sure to delete ?",
                    text: "You will not be able to recover this Data !!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes, delete it !!",
                    closeOnConfirm: false
                },
                function() {
                    $.ajax({
                        type: "GET",
                        url: delete_data + '/' + id1,
                        success: function(data) {

                            if (data == true) {
                                swal("Deleted !!", "Hey, your Data has been deleted !!", "success");
                                $('.closehideshow').trigger('click');
                                $('#save_update').val("");
                                datashow(); //call function show all data
                            } else {
                                errorTost("Data Delete Failed");
                            }

                        },
                        error: function(data) {
                            console.log('Error:', data);
                        }
                    });


                    return false;
                });
        }
    });

    //Delete  Button Code Strat  Here------





    $('#upload').change(function() {
        var id = $(this).attr('id');



        if ($(this).val() != '') {
            upload(this, id);

        }
    });

    $(document).on('click', '.closehideshow', function() {
        from_clear();
    });

    function upload(img, id) {
        $("#wait").show();
        var form_data = new FormData();
        form_data.append('file', img.files[0]);
        //form_data.append('_token', '{{csrf_token()}}');

        $.ajax({
            url: uploadfileurl,
            data: form_data,
            type: 'POST',
            contentType: false,
            processData: false,
            success: function(data) {
                //alert(data);

                //   $('#upload').val('');
                $('#msg').html(data);
                $('#uploadimg_hidden').val(data);
                $("#wait").hide();

            }
        });
    }

    //Delete  Button Code Strat  Here------

    $(document).on('change', '.btnstatus', function() {
        var id = $(this).attr('id');

        var status = "";

        if ($('#' + id).is(":checked")) {
            status = 1;
        } else {
            status = 0;
        }

        id = id.split("_");
        console.log("status" + status + "id" + id[1]);
        swal({
                title: "Are you sure Not Share Post ?",

                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes",
                closeOnConfirm: false
            },
            function() {
                $.ajax({
                    type: "GET",
                    url: changepostshare + '/' + id[1] + "/" +
                        status,
                    success: function(data) {

                        if (data == true) {

                            $('.cancel').trigger('click');
                            datashow(); //call function show all data
                        } else {
                            errorTost("Data Delete Failed");
                        }

                    },
                    error: function(data) {
                        console.log('Error:', data);
                    }
                });


                return false;
            });


    });


});