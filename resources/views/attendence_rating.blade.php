@include('layout.headerlink')


<body class="overflow-hidden">
    <!-- Overlay Div -->
    @include('layout.header')



    <div id="wrapper" class="preload">

        @include('layout.sidebar')
        <div id="main-container">
            <div id="breadcrumb">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home"></i><a href="#"> @lang('site_lables.Home')/ @lang('site_lables.Attendence_&_Rating')</a></li>
                    <li class="active"></li>
                </ul>
            </div><!-- /breadcrumb-->

            <div class="padding-md">
                <div class="row">
                    <div class="col-md-12">



                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4><b>@lang('site_lables.Attendence_&_Rating_Report')</b></h4>

                                {{-- <button type="button" class="btn btn-primary btn-xs pull-right btnhideshow"><i
                                                                class="fa fa-plus"></i> @lang('site_lables.Add_New')</button> --}}
                            </div>
                            <div class="panel-body">
                                <div class="form-group row">

                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label>@lang('site_lables.From')*</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <div class="input-group date" data-provide="datepicker">
                                                <input type="text"
                                                    class="form-control input-sm placeholdesize datepicker" id="from"
                                                    name="from" required>
                                                <div class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label>@lang('site_lables.To')*</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <div class="input-group date" data-provide="datepicker">
                                                <input type="text"
                                                    class="form-control input-sm placeholdesize datepicker" id="to"
                                                    name="to" required>
                                                <div class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label>@lang('site_lables.Class')*</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <select name="class" id="class" class="form-control input-sm">
                                                <option value="">All</option>
                                                <option value="1">Class 1</option>
                                                <option value="2">Class 2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label>@lang('site_lables.Instructor')*</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <select name="instructor" id="instructor" class="form-control input-sm">
                                                <option value="">All</option>
                                                <option value="1">Instructor 1</option>
                                                <option value="2">Instructor 2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <button type="button" class="btn btn-success">@lang('site_lables.Search')</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="table-responsive" id="show_master">
                                    <table class="table-striped" id="data_table" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>@lang('site_lables.Date_&_Time')</th>
                                                <th>@lang('site_lables.Class_Name')</th>
                                                <th>@lang('site_lables.Member_Id')</th>
                                                <th>@lang('site_lables.Member_Name')</th>
                                                <th>@lang('site_lables.Instructor_Rating')</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table_tbody">
                                            <tr>
                                                <td>01/01/2020 05:05:10</td>
                                                <td><a href="#">Abc</a></td>

                                                <td><a href="#">21</a></td>
                                                <td>Ajazkhan</td>
                                                <td>4.7</td>

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
            title: 'Attendence',
            exportOptions: {
            columns: [0, 1, 2, 3, 4]
            },

            },
            {
            extend: 'print',
            title: 'Attendence',
            exportOptions: {
           columns: [0, 1, 2, 3, 4]
            },



            }
            ]


    });
</script>
<script>
    $('.date').datepicker({
'todayHighlight': true,
format: 'dd/mm/yyyy',
autoclose: true,
});
var date = new Date();
date = date.toString('dd/MM/yyyy');

$("#from").val(date);
$("#to").val(date);
</script>

</html>
