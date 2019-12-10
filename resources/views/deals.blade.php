@include('layout.headerlink')


<body class="overflow-hidden">
    <!-- Overlay Div -->
    @include('layout.header')



    <div id="wrapper" class="preload">

        @include('layout.sidebar')
        <div id="main-container">
            <div id="breadcrumb">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home"></i><a href="#"> Home/Deals</a></li>
                    <li class="active"></li>
                </ul>
            </div><!-- /breadcrumb-->

            <div class="padding-md">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4><b>Deals</b></h4>

                                {{-- <button type="button" class="btn btn-primary btn-xs pull-right btnhideshow"><i
                                        class="fa fa-plus"></i> @lang('site_lables.Add_New')</button> --}}
                            </div>
                            <div class="panel-body ">
                                <div class="row " id="documents">

                                    <form id="master_form" name="master_form">

                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Title*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input type="text" id="deal_title" name="deal_title" class="form-control input-sm"
                                                    placeholder="title">
                                            </div>
                                        </div>

                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Upload Image or Video*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input type="file" id="upload" class="form-control" name="upload" accept="video/*,image/*" required>
                                                <input type="hidden" id="uploadimg_hidden" name="uploadimg_hidden" value="">
                                                <div id="msg" name="msg"></div>
                                            </div>
                                            <br>
                                        </div>

                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Start Date*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                    <div class='input-group datetimepicker' id='datetimepicker2'>
                                                            <input type='text' class="form-control" style="width:100%"
                                                                id="start_date" name="start_date" />
                                                            <div class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </div>
                                                        </div>
                                                {{-- <div class="input-group date" data-provide="datepicker">
                                                    <input type="text"
                                                        class="form-control input-sm placeholdesize datepicker"
                                                        id="start_date" name="start_date" required>
                                                    <div class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </div>
                                                </div> --}}
                                            </div>
                                        </div>

                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>End Date*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">

                                                    <div class='input-group datetimepicker' id='datetimepicker2'>
                                                            <input type='text' class="form-control" style="width:100%"
                                                                id="end_date" name="end_date" />
                                                            <div class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </div>
                                                        </div>
                                                {{-- <div class="input-group date" data-provide="datepicker">
                                                    <input type="text"
                                                        class="form-control input-sm placeholdesize datepicker"
                                                        id="end_date" name="end_date" required>
                                                    <div class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </div>
                                                </div> --}}
                                            </div>
                                        </div>






                                        <div class="col-lg-12">
                                            <div class="col-lg-10"></div>
                                            <div class="col-lg-2 " style="text-align: right">
                                                <input type="hidden" id="save_update" name="save_update" value="">

                                                <button type="submit" id="btnsave"
                                                    class="btn btn-sm btn-success btn-sm ">@lang('site_lables.Save')</button>

                                                <button type="button"
                                                    class="btn btn-sm btn-info  closehideshow">@lang('site_lables.Cancel')</button>
                                            </div>

                                        </div>

                                    </form>
                                </div>

                            </div><!-- /panel -->
                        </div><!-- /panel -->


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4><b>Deals List</b></h4>

                                {{-- <button type="button" class="btn btn-primary btn-xs pull-right btnhideshow"><i
                                                                class="fa fa-plus"></i> @lang('site_lables.Add_New')</button> --}}
                            </div>
                            <div class="panel-body ">

                                <div class="table-responsive" id="show_master">
                                    {{-- <table class="table-striped" id="data_table" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Title</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>


                                                <th>Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>A</td>
                                                <td>05/05/2005</td>
                                                <td>12/12/2012</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>B</td>
                                                <td>05/05/2006</td>
                                                <td>12/12/2015</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>C</td>
                                                <td>05/05/2007</td>
                                                <td>12/12/2019</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table> --}}
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
    $("#data_table").DataTable();
    
</script>
<script type="text/javascript">
    $(document).ready(function () {
    $.ajaxSetup({
    headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
    });

      // var getallcategory="{{ url('getallcategory') }}";
       $("#data_table").DataTable();

});

</script>
<script>
    var uploadfileurl="{{ url('dealuploadimg') }}";
    var checkexistdealtitle="{{ url('checkdealtitle') }}";
    var add_data="{{route('deals.store') }}";
    var delete_data="{{ url('deletedeals') }}";
    $('.clockpicker').clockpicker();
        $('.datetimepicker').datetimepicker({

        format: 'DD/MM/YYYY HH:mm:ss',

        });
$('.date').datepicker({
'todayHighlight': true,
format: 'dd/mm/yyyy',
autoclose: true,
});

var date = new Date();
var date2 = new Date();
date = date.toString('dd/MM/yyyy HH:mm:ss');
date2.setMinutes(date2.getMinutes() + 5);
date2 = date2.toString('dd/MM/yyyy HH:mm:ss');
                 
                    $("#end_date").val(date);
                    $("#start_date").val(date2);
</script>
<script type='text/javascript' src="{{ URL::asset('/resources/js/myjs/dealmaster.js',true) }}"></script>
</html>
