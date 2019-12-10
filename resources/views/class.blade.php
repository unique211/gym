@include('layout.headerlink')


<body class="overflow-hidden">
    <!-- Overlay Div -->
    @include('layout.header')



    <div id="wrapper" class="preload">

        @include('layout.sidebar')
        <div id="main-container">
            <div id="breadcrumb">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home"></i><a href="#"> Home/Class</a></li>
                    <li class="active"></li>
                </ul>
            </div><!-- /breadcrumb-->

            <div class="padding-md">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4><b>Class</b></h4>

                                {{-- <button type="button" class="btn btn-primary btn-xs pull-right btnhideshow"><i
                                        class="fa fa-plus"></i> @lang('site_lables.Add_New')</button> --}}
                            </div>
                            <div class="panel-body ">
                                <div class="row " id="documents">

                                    <form id="master_form" name="master_form">
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Class Name*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control input-sm placeholdesize"
                                                    placeholder="Class Name" id="class_name" name="class_name" required>
                                            </div>
                                        </div>

                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Class Category*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <select name="class_category" id="class_category"
                                                    class="form-control input-sm select2 placeholdesize">
                                                    <option value="" selected disabled>Select</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Class Description</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <textarea name="class_description" id="class_description"
                                                    class="form-control input-sm" placeholder="Description"
                                                    rows="2"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label>Status</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <input type="hidden" id="statusinfo" name="statusinfo" value="">
                                                    <input type="checkbox"  id="status" checked data-toggle="toggle"      data-on="Active" data-off="Inactive"  data-onstyle="success" data-offstyle="danger"  >
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
                                <h4><b>Class List</b></h4>

                                {{-- <button type="button" class="btn btn-primary btn-xs pull-right btnhideshow"><i
                                                                class="fa fa-plus"></i> @lang('site_lables.Add_New')</button> --}}
                            </div>
                            <div class="panel-body ">

                                <div class="table-responsive" id="show_master">
                                    {{-- <table class="table-striped" id="data_table" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Class Name</th>
                                                <th>Class Category</th>
                                                <th>Class Description</th>

                                                <th>Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Class 1</td>
                                                <td>Class cat 1</td>
                                                <td>desc 1</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Class 8</td>
                                                <td>Class cacxt 1</td>
                                                <td>descxc 1</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Class 6</td>
                                                <td>Class cat 1ew</td>
                                                <td>desc 1ew</td>
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
      
   </script>
<script>

        var add_data="{{route('class.store') }}";
       var checkcategory="{{ url('checkroomexist') }}";
       var delete_data="{{ url('deleteclass') }}";
       var changestatus="{{ url('classchangestatus') }}";
       var checkclassexists="{{ url('checkclassexist') }}";

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
<script type='text/javascript' src="{{ URL::asset('/resources/js/myjs/class.js',true) }}"></script>
</html>
