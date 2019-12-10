@include('layout.headerlink')


<body class="overflow-hidden">
    <!-- Overlay Div -->
    @include('layout.header')



    <div id="wrapper" class="preload">

        @include('layout.sidebar')
        <div id="main-container">
            <div id="breadcrumb">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home"></i><a href="#"> Home/Class Booking</a></li>
                    <li class="active"></li>
                </ul>
            </div><!-- /breadcrumb-->

            <div class="padding-md">
                <div class="row">
                    <div class="col-md-12">



                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4><b>Class Booking Report</b></h4>

                                {{-- <button type="button" class="btn btn-primary btn-xs pull-right btnhideshow"><i
                                                                class="fa fa-plus"></i> @lang('site_lables.Add_New')</button> --}}
                            </div>
                            <div class="panel-body ">

                                <div class="table-responsive" id="show_master">
                                    <table class="table-striped" id="data_table" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Class Name</th>
                                                <th>Schedule</th>
                                                <th>Instructor Name</th>
                                                <th>Number of members booked</th>
                                                <th>Max vacancy</th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Class 5</td>
                                                <td>10:00</td>
                                                <td>ABCD</td>
                                                <td><a href="#">21</a></td>
                                                <td>10</td>

                                            </tr>




                                        </tbody>
                                    </table>
                                </div>








                            </div><!-- /panel -->
                        </div><!-- /panel -->
                    </div><!-- /.col -->




                </div>
            </div><!-- /.padding-md -->
        </div><!-- /main-container -->

        @include('layout.footer')


    </div><!-- /wrapper -->

    <a href="" id="scroll-to-top" class="hidden-print"><i class="fa fa-chevron-up"></i></a>


    <!-- Logout confirmation -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    @include('layout.footerlink')

</body>
<script>
    $("#data_table").DataTable({
        dom: 'Bfrtip',

            buttons: [{
            extend: 'excelHtml5',
            title: 'Class Booking',
            exportOptions: {
            columns: [0, 1, 2, 3, 4]
            },

            },
            {
            extend: 'print',
            title: 'Class Booking',
            exportOptions: {
           columns: [0, 1, 2, 3, 4]
            },



            }
            ]


    });
</script>
<script>
    $('.dob').datepicker({
                       'todayHighlight': true,
                       format: 'dd/mm/yyyy',
                       autoclose: true,
                  });
                  var date = new Date();
                  date = date.toString('dd/MM/yyyy');
                  $("#dob").val(date);
                  //  $("#fdate").val(date);
</script>

</html>
